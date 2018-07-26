Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp308166wru;
        Thu, 26 Jul 2018 05:23:49 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpejJKxrNFHj7VCuHUGk5KX4/LRfBJMmEFDvtuZBsjnUgwiTIJb0yuWBGOHEzO1YAaPjKeFI
X-Received: by 2002:a37:209:: with SMTP id 9-v6mr1429686qkc.267.1532607829625;
        Thu, 26 Jul 2018 05:23:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532607829; cv=none;
        d=google.com; s=arc-20160816;
        b=RZ8LAHJDF4mWVOmrpQinErcpykw/U6vI1uz94uhJnXC2Z3+2eBtm1GOZOaaI9purdG
         ETOhptmkrZs2xMmsVfXlMgWgIxr1oTGWgc/TtuSXMc+3hEHiRz6cjWvLCeSIkBxzUGUi
         fgGf3f9qafJ03K3cxoONXAd6bfI5EB7fcnmD751Rw6AgnRX0waWd7qa8kJP3N4WbNgZO
         8zLhv558DsHkSRapClHgWxvKTElzLK3NET5LQmLigQRlYIag4RD0KCqvLaTwejPpdR45
         kv+IexZPvrfdDPYp3rEdnm1mRgy538rK37jtFhv3lc3ZKHuornNDJhQAGDBo0gMy51Ic
         v0CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :arc-authentication-results;
        bh=2ER77KMXwUwpX/JoDnkjQjRP3N1jnltB1sdGO/l8neM=;
        b=zh3n/YeXaHrAEaEa5LXaA+CWIWuqd9jPag5A1Tvu8aiORyemRYh18gol5D3/tNVm4S
         ERuKaf9b53zQpCzm34EZFfztch1BjaehwhgmnnYj3unkYCpfzLAmza9H1T0jPro+wd4I
         hHw1xnG/Y910bqec4Qot0C58t4R0UIJ1/+rM6rDcuwsm7r1qWEJHCUaZZC5U8Ly0eYZ+
         T3SJbf13Cjw0qoGLu+PE3udO8PLmyZOetOs1c+WA2q/OU7S+YPcQF/mCMXMjHNRANHSt
         SzyDGdxEbIr62kKIrTZIwwAOPcNN0XLp2tu2l2WusbSUuNQy3EXcwCtElKFoT23l5kDf
         JgOw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of lersek@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=lersek@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <lersek@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id x52-v6si1077474qvh.260.2018.07.26.05.23.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Jul 2018 05:23:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of lersek@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of lersek@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=lersek@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E10840241C8;
	Thu, 26 Jul 2018 12:23:49 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-78.rdu2.redhat.com [10.10.120.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 923F221568A1;
	Thu, 26 Jul 2018 12:23:47 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
To: Andrew Jones <drjones@redhat.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Hongbo Zhang <hongbo.zhang@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Leif Lindholm <leif.lindholm@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
 <CAHmQWvDu+P26Y5CJfcQ=1_9C=hej_B8w7dLMbmuOmCV-+pYOJQ@mail.gmail.com>
 <20180725114404.6g335n3rfjt23hjc@kamzik.brq.redhat.com>
 <CAHmQWvC44mLchhEFPU0T0gKWVcjjozp95ZumaKK9EkPwpeehTA@mail.gmail.com>
 <20180726104636.aua3pjsqkqnkvggk@kamzik.brq.redhat.com>
 <CAFEAcA80549kHSO+8z334PYmoWshzz+EHJcPBxsmhBN_dk+0Rw@mail.gmail.com>
 <CAKv+Gu-m0=MmkaR0UGJ4mmYSNHmk9QQh06Wxx6k2wXWq+QF46w@mail.gmail.com>
 <20180726111354.flyqh2yo4xm5z6m7@kamzik.brq.redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <d0eb219e-b3cb-d006-1857-a399a65376f8@redhat.com>
Date: Thu, 26 Jul 2018 14:23:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180726111354.flyqh2yo4xm5z6m7@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Thu, 26 Jul 2018 12:23:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Thu, 26 Jul 2018 12:23:49 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'lersek@redhat.com' RCPT:''
X-TUID: coYkwT/Zm8hy

On 07/26/18 13:13, Andrew Jones wrote:
> On Thu, Jul 26, 2018 at 12:56:22PM +0200, Ard Biesheuvel wrote:
>> On 26 July 2018 at 12:52, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On 26 July 2018 at 11:46, Andrew Jones <drjones@redhat.com> wrote:
>>>> i440fx and q35 are specific machine types. 'sbsa' is a generic machine
>>>> type that conforms to the SBSA specification. If you weren't trying to
>>>> memory map AHCI and EHCI controllers, or if memory mapped AHCI and EHCI
>>>> controllers were mandated in the SBSA spec, then there wouldn't be
>>>> anything to discuss. But that's not the case. You're attempting to
>>>> hard code one instance of a generic class of SBSA machines, but then
>>>> just call it 'sbsa'.
>>>
>>> Modelling a 'generic SBSA machine' is not the goal here (I'm
>>> not sure that's even possible or useful), so let's just
>>> stipulate that we'll call the machine type something else
>>> and move on ?
>>>
>>
>> Fine with me. Care to suggest a name? :-)
>>
> 
> Also fine by me, but I'm not going to suggest the name. I fear the
> backlash I'd receive after this mail thread!
> 

I suggest "showcase2018". (Dead serious.)

Laszlo
