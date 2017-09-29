Received: by 10.223.197.9 with SMTP id q9csp902261wrf;
        Fri, 29 Sep 2017 11:13:41 -0700 (PDT)
X-Received: by 10.200.45.91 with SMTP id o27mr7413980qta.319.1506708821188;
        Fri, 29 Sep 2017 11:13:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506708821; cv=none;
        d=google.com; s=arc-20160816;
        b=vgYOlE1qzOzAe62pKSDHxfKKJjxyIS/icCtkADAacPY43gdFzH8G4Df+DCkQIUd2sA
         /l0zHRyw/nS2iNDuEzU9K3MckAzy83zqNTSwxCyvWULafcdeb0WP4gSlFwZpk3QG+tW6
         nfQ868m9AZIQVTgo9k8w+1qYOLaimdQZe2UjIkpwpki8vtIS0bJkKMfMOLa8Ho1IYzQQ
         28OuL60b41yk1wamsrC+BynJw7JupT0wseGkRopaE0x10MhJac4TC/IhlJv9iKsi2yOK
         FVgFov1z5gjtl0FhBy8+YdyiZMhEGRoB/e84QxU8ziEG4bpyXS82Bkv5uiPdk+9zaZsw
         v0fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=CA8so48hupXpQdIN9bSRU/xW/fNRvYDwhtm7khA9S9w=;
        b=aF5Blcb6ZEaH8fXunWhvKyHajBq7oHN2YP53NvNO8Kf/IbJndkGf9CZfafIjf/PaLJ
         GobAvqS9MgMaPDZA/HMSYmZhzyNEfk/+UuWvydiXJ2I0ZwvJNoiKrk8nSs8YTXob5mlA
         +YCRaDnsA+6z4/AICOMJajJWqTxbYsxZq5WydsP2mv1RtIAoElqdQN5Nb6HfkT4ocYQI
         KqvjKTm3kF2CYRAnwTGJKBo7jp8pxHb1ksKNQGPl9WTySBZ77Nfy1brPCmNMrR5iOeAy
         VqRNvbH2mPGQ7oBOWrFs0h5VFcTDeuXMfUgFH4grQkgZNumcj+wHWZJC4NO7Mz+xK2qU
         eP3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iPoD8wEK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 75si4259349qtg.467.2017.09.29.11.13.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Sep 2017 11:13:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iPoD8wEK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Received: from localhost ([::1]:36533 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>)
	id 1dxzn8-0003ma-TE
	for alex.bennee@linaro.org; Fri, 29 Sep 2017 14:13:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dxzmz-0003l3-FT
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 14:13:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dxzmy-0003Rx-Kw
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 14:13:29 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:47674)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dxzmw-0003Px-DX; Fri, 29 Sep 2017 14:13:26 -0400
Received: by mail-wm0-x244.google.com with SMTP id t69so999073wmt.2;
	Fri, 29 Sep 2017 11:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=CA8so48hupXpQdIN9bSRU/xW/fNRvYDwhtm7khA9S9w=;
	b=iPoD8wEKfRr9lT7A4QMEIgdUWDnBRIELoHnnR93/TqccRbRyUcdhh28unBeUyov0Th
	EAsudIGsJdES8T8zWmB5H/kOtg63XrUx4JGWZ6KO7c6kZZ54UKIHpX4smql67lB6D42S
	APalSt7QFTlkNBqLx8/XfxIUkjqqApP1Il1Knd+YAzm2qRx+nJuZg45WpcSdULRK4dWN
	ncu4Xn5dQsZjnNB6+QGr4ZC1oHwtO+L7imo8I2YCJrxHxgfXcArtQeX6E4hlAWANlW2V
	hcWLrPQiJxkq58JlhNv6YOe3fApV76dfNfbJxtTdDDo5gFWnKydalF+sTfgz9MiieNl5
	2/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=CA8so48hupXpQdIN9bSRU/xW/fNRvYDwhtm7khA9S9w=;
	b=JxyWZgSw3J1N8mQTcrGVPXlMbT+Y6kIcnlYm+AoA7WieBdHeUIALgFb3X/6lwDzRNQ
	E+1uGsA4pNuBOoYJz7lavnVQkDWfnV3kQe6AyW5plG99uvWDuRvCsCTMbZpbQB+qv/wD
	jaepc3JOMR/ouKEQC9xDcbfPDKHDx7/ZlM4/NRgYTxMVbVFv/7/1BeZB3oyOi9UqJhRC
	XllZ6AxV7hNR0sy+HkLhdN8hkvHju8dp2/0P1oDUT3CR8eYWcIKalVPr+v87nrd8JvBS
	l/6EgkJF9g01gUm6+QLzfX0oIGCy2qT/NUiXMAohFc9eyGY21DJTdnbRcsbnBRyFSA7K
	Y9oA==
X-Gm-Message-State: AMCzsaW6PxvLzEyqFJZICBMaGG5Z9RjC6IEsAF9b5e1QIiZ3sAGwe7Vd
	lGMmaLyqHaG4pOIuwueLkgbui89kIqc7QLXQCNs=
X-Google-Smtp-Source: AOwi7QDvQLu6f2kM3rllwSmsfrqioCLSu4GPzxHNcxmX183CMAa5FnXJ63nmyvVbO4TfU4F+GOcMF2WXc9hPzWQTF+Y=
X-Received: by 10.28.130.130 with SMTP id e124mr4324829wmd.75.1506708805188;
	Fri, 29 Sep 2017 11:13:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.135.139 with HTTP; Fri, 29 Sep 2017 11:12:54 -0700 (PDT)
In-Reply-To: <adae1793-1a4a-7107-7676-f6dbaa26a9f4@redhat.com>
References: <cover.1506384414.git.alistair.francis@xilinx.com>
	<5ad72536402da2879d49b58753cc709a8ff22de9.1506384415.git.alistair.francis@xilinx.com>
	<adae1793-1a4a-7107-7676-f6dbaa26a9f4@redhat.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 29 Sep 2017 11:12:54 -0700
X-Google-Sender-Auth: KJM2OHZHEq9SCRiS1TLcySuQlts
Message-ID: <CAKmqyKN-kB964To18yv-ScHX98R61iUN5JUCyyv0JO2fqKEwxg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 8/8] target: Replace
 fprintf(stderr, "*\n" with error_report()
X-BeenThere: qemu-arm@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@gnu.org>
List-Help: <mailto:qemu-arm-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=subscribe>
Cc: Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	"open list:New World" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Yongbok Kim <yongbok.kim@imgtec.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Aurelien Jarno <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
X-TUID: WAw2quztWCbd

On Mon, Sep 25, 2017 at 9:08 PM, Thomas Huth <thuth@redhat.com> wrote:
> On 26.09.2017 02:09, Alistair Francis wrote:
>> Replace a large number of the fprintf(stderr, "*\n" calls with
>> error_report(). The functions were renamed with these commands and then
>> compiler issues where manually fixed.
> [...]
>> @@ -9281,18 +9281,19 @@ static void init_ppc_proc(PowerPCCPU *cpu)
>>          case POWERPC_FLAG_PMM:
>>              break;
>>          default:
>> -            fprintf(stderr, "PowerPC MSR definition inconsistency\n"
>> -                    "Should define POWERPC_FLAG_PX or POWERPC_FLAG_PMM\n");
>> +            error_report("PowerPC MSR definition inconsistency");
>> +            error_printf("Should define POWERPC_FLAG_PX or POWERPC_FLAG_PMM");
>>              exit(1);
>>          }
>>      } else if (env->flags & (POWERPC_FLAG_PX | POWERPC_FLAG_PMM)) {
>> -        fprintf(stderr, "PowerPC MSR definition inconsistency\n"
>> -                "Should not define POWERPC_FLAG_PX nor POWERPC_FLAG_PMM\n");
>> +        error_report("PowerPC MSR definition inconsistency");
>> +        error_printf("Should not define POWERPC_FLAG_PX nor POWERPC_FLAG_PMM");
>>          exit(1);
>>      }
>>      if ((env->flags & (POWERPC_FLAG_RTC_CLK | POWERPC_FLAG_BUS_CLK)) == 0) {
>> -        fprintf(stderr, "PowerPC flags inconsistency\n"
>> -                "Should define the time-base and decrementer clock source\n");
>> +        error_report("PowerPC MSR definition inconsistency");
>> +        error_printf("Should define the time-base and decrementer clock"
>> +                     " source");
>>          exit(1);
>>      }
>
> Replacing fprintf with error_report+error_printf is kind of very ugly.
> While error_report adds newline to the output, error_printf does not (as
> far as I can see) ... did you check how such a message looks like when
> it is generated during runtime?
> Also, the strings belong together, so printing them with two function
> calls sound wrong to me... maybe they should be joined without newline
> in the middle instead?

Ok, that works for me, I'll do that.

Thanks,
Alistair

>
>  Thomas
