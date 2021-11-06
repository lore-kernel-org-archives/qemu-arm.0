Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp3327010lfv;
        Sat, 6 Nov 2021 03:04:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZkBJKWGkWnmCdGxB98kkeu+97zsBr5WV4DEM6v1wQ+DTQGFWiCLTFxI8J1aiN9FF7Rvdf
X-Received: by 2002:a05:6830:1314:: with SMTP id p20mr10911457otq.381.1636193084211;
        Sat, 06 Nov 2021 03:04:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1636193084; cv=none;
        d=google.com; s=arc-20160816;
        b=SrT97Tz+UqP0uHpvkPSTdU4BAYrDafdPID+wUNSVLVJdJv+I2E+VnvaOYnAOXhO9K4
         5lkSeo8MwI7Mze+6eB4d2q5RF1rXogUSweot2ChDELam5nojoQxfPfFF3SHAV4UpLjUM
         J2RJuyzbVRcSZRg7VdLbNpFd59R3CO5WqBYsbXxaBDJILapB+ruJJb0uEu/OBB/aiFNi
         t/Ro5RMPqMoOsg0jY6N1C9uwSHtIayD0DnHRgg+bAM8LPVeDtKwEGKWkBYknW4Ya5nbO
         h/n8s/zQNYp2aYTKDsuBL2Oiy35SAM7EAUctNBMVPptvLnPPyvXnN5RbX+2DllNh62C5
         l29w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=xRzYFIvCYWvxCvRgrBs+B/sRQ9r6xiKk6HmjjHYgupg=;
        b=f9YxyzJHE04s51e8XR8sBV+YqC73ZbsaDSM5pSC++/nCQAJ5MX3GmkNhHIqcgPJIgU
         /N8W92tdj285RZsCCB5eqQcGKwea7hRAOeDvnKDBS/VUat+VSvRpNueHddagKODt3byz
         uKT8BlZl2WHe/FsOFueI50D0Nz38JCjlxcMXAIKa9hLax+93BA1xqbBO74P5sQ3w+8pX
         +M8htIOKzXgXure0MNDJpdW9LI2PLEJcMX+g3yNfU3CXpMr410X53/3+fQTg3ctFCotv
         WZf+kwSdYCe2KK5/V+BBhIIKQ0siv7E8m83StZgau8TuRadbuB6iHhsmrdQPo5f1aL6N
         Fq9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bc7si6488320oob.27.2021.11.06.03.04.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 Nov 2021 03:04:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mjIZ1-0005tF-Ez
	for alex.bennee@linaro.org; Sat, 06 Nov 2021 06:04:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1mjIYc-0005t0-Ex; Sat, 06 Nov 2021 06:04:18 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:60793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1mjIYZ-0004MJ-Ix; Sat, 06 Nov 2021 06:04:18 -0400
Received: (Authenticated sender: jcd@tribudubois.net)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 64187E0007;
 Sat,  6 Nov 2021 10:04:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------3ReN9D51jAnO062HfSsQ2RFW"
Message-ID: <d19f6d2c-7505-b326-3a67-48c336f111e9@tribudubois.net>
Date: Sat, 6 Nov 2021 11:04:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: Qemu and ARM secure state.
Content-Language: en-US
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
To: Peter Maydell <peter.maydell@linaro.org>
References: <07e63acb-b756-2586-2ba2-b54b837f7fc8@tribudubois.net>
 <CAFEAcA89YQ_vN-JpCeB+L==F5g1hM=CNMBzjaf5c3EHF19NVyQ@mail.gmail.com>
 <c8b89685-7490-328b-51a3-48711c140a84@tribudubois.net>
In-Reply-To: <c8b89685-7490-328b-51a3-48711c140a84@tribudubois.net>
Received-SPF: pass client-ip=217.70.183.196; envelope-from=jcd@tribudubois.net;
 helo=relay4-d.mail.gandi.net
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-3.407, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zUb2HsTadnZ3

This is a multi-part message in MIME format.
--------------3ReN9D51jAnO062HfSsQ2RFW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

So, I am trying to understand:

Contrary to what I said, In my case the SMC instruction is not really a 
"no-op" as it sets R0 to -1 (0xffffffff) to indicate an unknown PSCI 
service (by the Qemu internal PSCI handler).

With the new code introduced by the "arm: tcg: Adhere to SMCCC 1.3 
section 5.2" commit, once a processor/platform configure things to have 
PSCI requests handled by Qemu code (with "psci-conduit" attribute set to 
QEMU_PSCI_CONDUIT_SMC for example), then any exception raised by an 
"SMC" instruction will be only handled by the Qemu internal code and 
will no call the monitor related code in the guest/OS application. This 
seems to be why my SMC monitor handler is not called anymore in my case.

As my i.MX6UL is a mono-processor platform I don't really need to set 
the "psci-conduit" attribute (which really makes sense when you have a 
cluster of 2 or more cores I guess). As a matter of fact if I remove the 
"psci-conduit" attribute setting from the i.MX6UL processor file, my 
application is working again on main/latest.

But this still raises the question to know if the current behavior for 
processors with "psci-conduit" set to SMC or HVC is correct. For example 
an i.MX7 based platform (with up to 4 cortex A7 cores) would not be able 
to trigger OS SMC handler as the exception would be entirely processed 
by the Qemu internal code (with CR generally set to -1 in R0 to indicate 
unknown PSCI request).

Is there something I am missing?

Regards

JC

Le 04/11/2021 à 22:11, Jean-Christophe DUBOIS a écrit :
> Le 04/11/2021 à 12:11, Peter Maydell a écrit :
>> On Wed, 3 Nov 2021 at 13:27, Jean-Christophe DUBOIS<jcd@tribudubois.net>  wrote:
>>> I have a little application that is designed to work on the i.MX6UL processor.
>>>
>>> I developed it and tested it on the mcimx6ul-evk platform emulated by Qemu.
>>>
>>> This application used to work "flawlessly" on Qemu 5.0.50 and is working on Qemu 6.0.0 (available as a pre-built package on the latest Ubuntu).
>>>
>>> But when I try to run the exact same command line on a Qemu version I compile myself from main/latest of github (Qemu 6.1.50), my application fails to start.
>>>
>>> So a little background:
>>>
>>> My application expects to start in "secure" state and supervisor mode (which is the default state of i.MX6UL when booting barebone [without u-boot]).
>>>
>>> >From this state the application tries to get to "non secure" / hypervisor mode which imply going to the "secure" / monitor state before being able to drop to "non secure" / hypervisor. To do so is runs a "smc 0" operand (from "secure" / supervisor).
>>>
>>> This "smc" instruction is processed "as expected" by Qemu 5.0.50 and Qemu 6.0.0 (getting to "secure" / monitor mode) but on Qemu 6.1.50 (latest from github) it is as if the smc operand was a no-op. It doesn't trigger any exception and the processor just get to the next instruction after the "smc" instruction. So I am a bit puzzled.
>>>
>>> Is there something that changed in Qemu (since Qemu 6.0.0) when it comes to the "secure" world/state?
>>> Is there some additional command line parameters to use (I search in the documentation but without luck) to get secure world behavior ?
>>> Is it necessary to "adapt" the emulated platform (i.MX6UL/mcimx6ul-evk) in some way (it looks like the "virt" machine with "secure=on" does work for arm platform)?
>> Could you try doing a bisect to find the QEMU commit that caused
>> your guest to stop working ?
>
> OK, I did the bisect and the commit that break the i.MX6UL behavior 
> for my program is commit 9fcd15b9193e819b6cc2fd0a45e3506148812bb4 
> (arm: tcg: Adhere to SMCCC 1.3 section 5.2).
>
> Before it the SMC instruction would trigger a monitor exception.
>
> After it the SMC instruction is acting like a no-op.
>
> Thanks
>
> JC
>
>
>> thanks
>> -- PMM
>>
>

--------------3ReN9D51jAnO062HfSsQ2RFW
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">So, I am trying to understand:</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Contrary to what I said, In my case the
      SMC instruction is not really a "no-op" as it sets R0 to -1
      (0xffffffff) to indicate an unknown PSCI service (by the Qemu
      internal PSCI handler).<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">With the new code introduced by the
      "arm: tcg: Adhere to SMCCC 1.3 section 5.2" commit, once a
      processor/platform configure things to have PSCI requests handled
      by Qemu code (with "psci-conduit" attribute set to
      QEMU_PSCI_CONDUIT_SMC for example), then any exception raised by
      an "SMC" instruction will be only handled by the Qemu internal
      code and will no call the monitor related code in the guest/OS
      application. This seems to be why my SMC monitor handler is not
      called anymore in my case.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">As my i.MX6UL is a mono-processor
      platform I don't really need to set the "psci-conduit" attribute
      (which really makes sense when you have a cluster of 2 or more
      cores I guess). As a matter of fact if I remove the "psci-conduit"
      attribute setting from the i.MX6UL processor file, my application
      is working again on main/latest.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">But this still raises the question to
      know if the current behavior for processors with "psci-conduit"
      set to SMC or HVC is correct. For example an i.MX7 based platform
      (with up to 4 cortex A7 cores) would not be able to trigger OS SMC
      handler as the exception would be entirely processed by the Qemu
      internal code (with CR generally set to -1 in R0 to indicate
      unknown PSCI request).</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Is there something I am missing?<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Regards</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">JC<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Le 04/11/2021 à 22:11, Jean-Christophe
      DUBOIS a écrit :<br>
    </div>
    <blockquote type="cite"
      cite="mid:c8b89685-7490-328b-51a3-48711c140a84@tribudubois.net">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div class="moz-cite-prefix">Le 04/11/2021 à 12:11, Peter Maydell
        a écrit :<br>
      </div>
      <blockquote type="cite"
cite="mid:CAFEAcA89YQ_vN-JpCeB+L==F5g1hM=CNMBzjaf5c3EHF19NVyQ@mail.gmail.com">
        <pre class="moz-quote-pre" wrap="">On Wed, 3 Nov 2021 at 13:27, Jean-Christophe DUBOIS <a class="moz-txt-link-rfc2396E" href="mailto:jcd@tribudubois.net" moz-do-not-send="true">&lt;jcd@tribudubois.net&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">I have a little application that is designed to work on the i.MX6UL processor.

I developed it and tested it on the mcimx6ul-evk platform emulated by Qemu.

This application used to work "flawlessly" on Qemu 5.0.50 and is working on Qemu 6.0.0 (available as a pre-built package on the latest Ubuntu).

But when I try to run the exact same command line on a Qemu version I compile myself from main/latest of github (Qemu 6.1.50), my application fails to start.

So a little background:

My application expects to start in "secure" state and supervisor mode (which is the default state of i.MX6UL when booting barebone [without u-boot]).

&gt;From this state the application tries to get to "non secure" / hypervisor mode which imply going to the "secure" / monitor state before being able to drop to "non secure" / hypervisor. To do so is runs a "smc 0" operand (from "secure" / supervisor).

This "smc" instruction is processed "as expected" by Qemu 5.0.50 and Qemu 6.0.0 (getting to "secure" / monitor mode) but on Qemu 6.1.50 (latest from github) it is as if the smc operand was a no-op. It doesn't trigger any exception and the processor just get to the next instruction after the "smc" instruction. So I am a bit puzzled.

Is there something that changed in Qemu (since Qemu 6.0.0) when it comes to the "secure" world/state?
Is there some additional command line parameters to use (I search in the documentation but without luck) to get secure world behavior ?
Is it necessary to "adapt" the emulated platform (i.MX6UL/mcimx6ul-evk) in some way (it looks like the "virt" machine with "secure=on" does work for arm platform)?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Could you try doing a bisect to find the QEMU commit that caused
your guest to stop working ?</pre>
      </blockquote>
      <p>OK, I did the bisect and the commit that break the i.MX6UL
        behavior for my program is commit <span class="sha-block"><span
            class="sha user-select-contain">9fcd15b9193e819b6cc2fd0a45e3506148812bb4
            (</span></span>arm: tcg: Adhere to SMCCC 1.3 section 5.2).</p>
      <p>Before it the SMC instruction would trigger a monitor
        exception.</p>
      <p>After it the SMC instruction is acting like a no-op.<br>
      </p>
      <p>Thanks</p>
      <p>JC<br>
      </p>
      <p><span class="sha-block"><span class="sha user-select-contain"></span></span></p>
      <p><span class="sha-block"><span class="sha user-select-contain"><br>
          </span></span></p>
      <blockquote type="cite"
cite="mid:CAFEAcA89YQ_vN-JpCeB+L==F5g1hM=CNMBzjaf5c3EHF19NVyQ@mail.gmail.com">
        <pre class="moz-quote-pre" wrap="">thanks
-- PMM

</pre>
      </blockquote>
      <p><br>
      </p>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>
--------------3ReN9D51jAnO062HfSsQ2RFW--

