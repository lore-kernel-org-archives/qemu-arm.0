Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp258165wme;
        Tue, 15 May 2018 06:13:55 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoNGGT163N0jjwtZJVrSt8aS4SqaUmjZWB5pdgr3cCMs+UGx7S3Qy3+zN+ejV690XkdG0T6
X-Received: by 2002:a0c:f7c5:: with SMTP id f5-v6mr13195333qvo.98.1526390035333;
        Tue, 15 May 2018 06:13:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526390035; cv=none;
        d=google.com; s=arc-20160816;
        b=va0u8vl9u93n3n34MXHNFUa2OgiaEMP9DAATG5c5KBaCvwN9ZR7xgucqQAm4ucldoU
         bHAdvONDytmPFpFklZbDsftonxJ7J3c9vWldSMyjccrYPl7s9Sri2TQ88kGWEkpHU5uI
         0qNzQhOQVrgUELYzVdjDUmN7uSb5LBmJSzTUy5V/xX585SmIZw0dPCEsZXYlKvsHA5T4
         CemSQ/EEA4Dsnk9tSN73awXG4Q4XHkYjmjgM0iSbH6aqy3+BRfXacX2OX9cRRPIdV5tH
         OwFv5WZhO0XHN/PPZan6u1qvDRVSFF5etGWKu6FYLfrz54Gpl9Nv1CVacGL/aYRs6ol3
         WlGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:openpgp:from
         :references:to:arc-authentication-results;
        bh=g6Fdh+FQ8sQwnhC1QFUY2vsElQIhD9n6DDYji8osLT4=;
        b=K48GGCWAwaTmUH/NI9eDqWwrY6xNgPQbgqQ1mig5gNnj6HAqgqbuMdjFQ39hhu2Qef
         dMTNYMqveN6JtSRmzW9ehGkLCNtFqHF0OM0HWWI3ZvKq3y4/RhYFuoESAhLHDsau4XG6
         Gt2szKEt8MTd45RayULvtmYR6w2YmbX12x61GlgT4SD0g0tLlf3SichQFwHW1hj+22Hg
         PNSXuRKFdRowkDBblgUc7UE/D8dGdQnRkaIGx8WqEIIdg9IbxLIbNesSeS9cGXKvGjnK
         3swzJZXFUHDUC7wkuGdnRiSFo/bmQ/IQFuu9yVbOL3MVynwbibB1bBz2FJP7y4XJBJ9f
         eRGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j18-v6si11644qtp.300.2018.05.15.06.13.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 May 2018 06:13:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37499 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fIZm6-00084I-Qc
	for alex.bennee@linaro.org; Tue, 15 May 2018 09:13:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1fIZlt-00082g-CS
	for qemu-arm@nongnu.org; Tue, 15 May 2018 09:13:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1fIZlq-0004cY-5g
	for qemu-arm@nongnu.org; Tue, 15 May 2018 09:13:41 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:37958
	helo=v2201612906741603.powersrv.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sw@weilnetz.de>)
	id 1fIZlp-0004bI-Q8; Tue, 15 May 2018 09:13:38 -0400
Received: from localhost (localhost [127.0.0.1])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id 75BC4DAC77C;
	Tue, 15 May 2018 15:13:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
	by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 6B7tCxhiHVN1; Tue, 15 May 2018 15:13:31 +0200 (CEST)
Received: from [134.155.36.73] (edv13.bib.uni-mannheim.de [134.155.36.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 6B84CDAC5FE; 
	Tue, 15 May 2018 15:13:31 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180513090613.27960-1-sw@weilnetz.de>
	<cc3f26a7-a8b7-35a8-9ffa-c5940c9c1927@weilnetz.de>
	<CAFEAcA9kcKb28uQJOnqCAC4Gf9b7Hnu0wJbG1nHQLF4U1T9sKA@mail.gmail.com>
From: Stefan Weil <sw@weilnetz.de>
Openpgp: preference=signencrypt
Message-ID: <99693ba4-c282-a10b-e811-697617f7ee06@weilnetz.de>
Date: Tue, 15 May 2018 15:13:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9kcKb28uQJOnqCAC4Gf9b7Hnu0wJbG1nHQLF4U1T9sKA@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary="------------9416F0F08DE340DC72923204"
Content-Language: en-GB
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.120.169.71
Subject: Re: [Qemu-arm] [PATCH] disas/libvixl: Fix VIXL_FALLTHROUGH macro
 for QEMU
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developer <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yLARiY8S7XPI

This is a multi-part message in MIME format.
--------------9416F0F08DE340DC72923204
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Am 15.05.2018 um 14:13 schrieb Peter Maydell:
> On 13 May 2018 at 10:57, Stefan Weil <sw@weilnetz.de> wrote:
>> Even with the above patch, disas/libvixl raises a compiler warning for a
>> fall through case. The patch below fixes that warning, but I am not sure
>> whether a fall through is correct there.
>>
>> Stefan
>>
>>
>> diff --git a/disas/libvixl/vixl/a64/disasm-a64.cc
>> b/disas/libvixl/vixl/a64/disasm-a64.cc
>> index 7a58a5c087..5481d94209 100644
>> --- a/disas/libvixl/vixl/a64/disasm-a64.cc
>> +++ b/disas/libvixl/vixl/a64/disasm-a64.cc
>> @@ -2986,6 +2986,7 @@ int Disassembler::SubstituteImmediateField(const
>> Instruction* instr,
>>            return 3;
>>          }
>>        }
>> +      VIXL_FALLTHROUGH(); // ???
>>      }
>>      case 'C': {  // ICondB - Immediate Conditional Branch.
>>        int64_t offset = instr->ImmCondBranch() << 2;
> This is fixed in upstream vixl, in fact:
>
> https://git.linaro.org/arm/vixl.git/commit/?id=de326f850f736c3a337fda52845ed3d2e620cc02
>
> thanks
> -- PMM


That fix will work for the moment, but is not sufficient for the future
because it only supports gcc 7.x, but not gcc 8.x or later:

+#elif __GNUC__ == 7

How do we proceed with the code in QEMU? Do you have a plan to update
the vixl code? As vixl is obviously no longer maintained on GitHub, I am
not sure whom I could contact.

And what about my other question / suggestion:

"I suggest to add and use a similar macro QEMU_FALLTHROUGH() for the
rest of the code and can provide a patch if that's fine for everyone."

gcc gives lots of fallthrough warnings, and many code locations don't contain a comment stating that the fall through is fine.

Thanks
Stefan



--------------9416F0F08DE340DC72923204
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Am 15.05.2018 um 14:13 schrieb Peter
      Maydell:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAFEAcA9kcKb28uQJOnqCAC4Gf9b7Hnu0wJbG1nHQLF4U1T9sKA@mail.gmail.com">
      <pre wrap="">On 13 May 2018 at 10:57, Stefan Weil <a class="moz-txt-link-rfc2396E" href="mailto:sw@weilnetz.de">&lt;sw@weilnetz.de&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Even with the above patch, disas/libvixl raises a compiler warning for a
fall through case. The patch below fixes that warning, but I am not sure
whether a fall through is correct there.

Stefan


diff --git a/disas/libvixl/vixl/a64/disasm-a64.cc
b/disas/libvixl/vixl/a64/disasm-a64.cc
index 7a58a5c087..5481d94209 100644
--- a/disas/libvixl/vixl/a64/disasm-a64.cc
+++ b/disas/libvixl/vixl/a64/disasm-a64.cc
@@ -2986,6 +2986,7 @@ int Disassembler::SubstituteImmediateField(const
Instruction* instr,
           return 3;
         }
       }
+      VIXL_FALLTHROUGH(); // ???
     }
     case 'C': {  // ICondB - Immediate Conditional Branch.
       int64_t offset = instr-&gt;ImmCondBranch() &lt;&lt; 2;
</pre>
      </blockquote>
      <pre wrap="">
This is fixed in upstream vixl, in fact:

<a class="moz-txt-link-freetext" href="https://git.linaro.org/arm/vixl.git/commit/?id=de326f850f736c3a337fda52845ed3d2e620cc02">https://git.linaro.org/arm/vixl.git/commit/?id=de326f850f736c3a337fda52845ed3d2e620cc02</a>

thanks
-- PMM
</pre>
    </blockquote>
    <p><br>
    </p>
    <tt>That fix will work for the moment, but is not sufficient for the
      future because it only supports gcc 7.x, but not gcc 8.x or later:</tt><tt><br>
      <br>
    </tt>
    <div class="add"><tt>+#elif __GNUC__ == 7</tt><tt><br>
      </tt><tt><br>
      </tt><tt>How do we proceed with the code in QEMU? Do you have a
        plan to update the vixl code? As vixl is obviously no longer
        maintained on GitHub, I am not sure whom I could contact.</tt><tt><br>
      </tt><tt><br>
      </tt><tt>And what about my other question / suggestion:</tt><br>
      <br>
      "I suggest to add and use a similar macro QEMU_FALLTHROUGH() for
      the rest of the code and can provide a patch if that's fine for
      everyone."<br>
      <pre wrap="">
gcc gives lots of fallthrough warnings, and many code locations don't contain a comment stating that the fall through is fine.

Thanks
Stefan
</pre>
      <br>
    </div>
  </body>
</html>

--------------9416F0F08DE340DC72923204--
