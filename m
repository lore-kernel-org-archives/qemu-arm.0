Received: by 10.25.205.13 with SMTP id d13csp1631690lfg;
        Mon, 12 Dec 2016 05:10:27 -0800 (PST)
X-Received: by 10.28.197.6 with SMTP id v6mr16594155wmf.130.1481548227071;
        Mon, 12 Dec 2016 05:10:27 -0800 (PST)
Return-Path: <Claudio.Fontana@huawei.com>
Received: from lhrrgout.huawei.com (lhrrgout.huawei.com. [194.213.3.17])
        by mx.google.com with ESMTPS id c137si28206407wmd.151.2016.12.12.05.10.26
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Dec 2016 05:10:27 -0800 (PST)
Received-SPF: pass (google.com: domain of claudio.fontana@huawei.com designates 194.213.3.17 as permitted sender) client-ip=194.213.3.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of claudio.fontana@huawei.com designates 194.213.3.17 as permitted sender) smtp.mailfrom=Claudio.Fontana@huawei.com
Received: from 172.18.7.190 (EHLO lhreml704-cah.china.huawei.com) ([172.18.7.190])
	by lhrrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DCK44116;
	Mon, 12 Dec 2016 13:10:23 +0000 (GMT)
Received: from [10.201.114.236] (10.201.114.236) by
 lhreml704-cah.china.huawei.com (10.201.5.130) with Microsoft SMTP Server id
 14.3.301.0; Mon, 12 Dec 2016 13:10:20 +0000
To: Peter Maydell <peter.maydell@linaro.org>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?=
	<alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
        qemu-arm
	<qemu-arm@nongnu.org>
From: Claudio Fontana <claudio.fontana@huawei.com>
Subject: TCG AArch64 target maintained status change
Message-ID: <584EA1BC.7030801@huawei.com>
Date: Mon, 12 Dec 2016 14:10:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:38.0) Gecko/20100101
 Thunderbird/38.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.201.114.236]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090204.584EA1C1.0234,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
	ip=0.0.0.0,
	so=2013-06-18 04:22:30,
	dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 60dab79c019cbed83c6ab0920170dcd7
X-TUID: 0x36xuAm0Usi

Hello all,

the last bug report from Alex pointed me to the fact that I am unable to focus on TCG AArch64 maintenance, due to changed working conditions since some time now.

I think that in practice Richard has been taking care of this module anyway, so I think it is time to make it official.
Should I send a patch to change Maintained to Orphaned for the MAINTAINERS file?
Or maybe Peter, Richard you can directly appoint the replacement name in there?

Thanks,

Claudio
