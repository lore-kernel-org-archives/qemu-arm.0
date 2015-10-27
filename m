Received: by 10.182.105.169 with SMTP id gn9csp1810856obb;
        Tue, 27 Oct 2015 09:59:37 -0700 (PDT)
X-Received: by 10.140.233.196 with SMTP id e187mr51439284qhc.86.1445965177018;
        Tue, 27 Oct 2015 09:59:37 -0700 (PDT)
Return-Path: <jsnow@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id s93si37918307qgs.72.2015.10.27.09.59.36
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2015 09:59:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of jsnow@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jsnow@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=jsnow@redhat.com
Received: from int-mx14.intmail.prod.int.phx2.redhat.com (int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 59590C0A147D;
	Tue, 27 Oct 2015 16:59:36 +0000 (UTC)
Received: from scv.usersys.redhat.com (dhcp-17-163.bos.redhat.com [10.18.17.163])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id t9RGxZac026609;
	Tue, 27 Oct 2015 12:59:35 -0400
Subject: Re: [Qemu-devel] proposal: new qemu-arm mailing list
To: Peter Maydell <peter.maydell@linaro.org>,
        Pavel Fedin <p.fedin@samsung.com>
References: <CAFEAcA-s_hSQiLCkQDeX2rR12PcPx5yZ885yZy7C=ZWA5DDbTw@mail.gmail.com>
 <012d01d110a7$b1915690$14b403b0$@samsung.com>
 <CAFEAcA9H6vegRYU+_0aULnH8dRcm70M28Eg7uzB8013sspG8Yg@mail.gmail.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Peter Crosthwaite <crosthwaitepeter@gmail.com>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Paolo Bonzini <pbonzini@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <562FAD77.6060704@redhat.com>
Date: Tue, 27 Oct 2015 12:59:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9H6vegRYU+_0aULnH8dRcm70M28Eg7uzB8013sspG8Yg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-TUID: BDH9gSUZEL28



On 10/27/2015 07:16 AM, Peter Maydell wrote:
> On 27 October 2015 at 11:07, Pavel Fedin <p.fedin@samsung.com> wrote:
>>> (Everything should still be cc'd to qemu-devel as well.)
>>
>>  I would drop this requirement, except for stuff which could touch
>> core functionality (qom, qobject).
> 
> This is a standard requirement for all our sub-mailing lists --
> not everybody is subscribed to all of them, and it is useful
> to be able to get an overview of everything going on by
> subscribing to a single mailing list.
> 
> thanks
> -- PMM
> 

Just to jump on and bead a dead horse, I am not OK with the idea of a
mailing list where patches might get reviewed and staged for pull
without the general population of qemu-devel being able to look first.

I don't want to have to scan the [PULL] tag hoping to catch things of
interest to me that were reviewed on opaque-to-me sub-mailing lists.

--js
