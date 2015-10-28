Received: by 10.182.105.169 with SMTP id gn9csp2368276obb;
        Wed, 28 Oct 2015 08:20:34 -0700 (PDT)
X-Received: by 10.140.240.17 with SMTP id l17mr30804330qhc.69.1446045633840;
        Wed, 28 Oct 2015 08:20:33 -0700 (PDT)
Return-Path: <jsnow@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id o89si42562026qkl.8.2015.10.28.08.20.33
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2015 08:20:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jsnow@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=jsnow@redhat.com
Received: from int-mx10.intmail.prod.int.phx2.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id C26D2225;
	Wed, 28 Oct 2015 15:20:32 +0000 (UTC)
Received: from scv.usersys.redhat.com (dhcp-17-163.bos.redhat.com [10.18.17.163])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id t9SFKVmA021601;
	Wed, 28 Oct 2015 11:20:31 -0400
Subject: Re: [Qemu-devel] proposal: new qemu-arm mailing list
To: Pavel Fedin <p.fedin@samsung.com>,
        "'Peter Maydell'" <peter.maydell@linaro.org>
References: <CAFEAcA-s_hSQiLCkQDeX2rR12PcPx5yZ885yZy7C=ZWA5DDbTw@mail.gmail.com>
 <012d01d110a7$b1915690$14b403b0$@samsung.com>
 <CAFEAcA9H6vegRYU+_0aULnH8dRcm70M28Eg7uzB8013sspG8Yg@mail.gmail.com>
 <562FAD77.6060704@redhat.com> <008601d1114c$c5fa0aa0$51ee1fe0$@samsung.com>
Cc: "'Edgar E. Iglesias'" <edgar.iglesias@gmail.com>,
        "'Peter Crosthwaite'" <crosthwaitepeter@gmail.com>,
        "=?UTF-8?Q?'Alex_Benn=c3=a9e'?=" <alex.bennee@linaro.org>,
        "'QEMU Developers'" <qemu-devel@nongnu.org>,
        "'Paolo Bonzini'" <pbonzini@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <5630E7BF.8000000@redhat.com>
Date: Wed, 28 Oct 2015 11:20:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <008601d1114c$c5fa0aa0$51ee1fe0$@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-TUID: nWzlWGbdnl6w



On 10/28/2015 02:49 AM, Pavel Fedin wrote:
>  Hello!
> 
>> Just to jump on and bead a dead horse, I am not OK with the idea of a
>> mailing list where patches might get reviewed and staged for pull
>> without the general population of qemu-devel being able to look first.
> 
>  Ok ok, i don't object, Peter has already explained a similar thing to me, and i silently agreed.
> 
> Kind regards,
> Pavel Fedin
> Expert Engineer
> Samsung Electronics Research center Russia
> 
> 

Sorry :)

I am of course in favor of the list in general. qemu-block has been very
useful for us.

--js
