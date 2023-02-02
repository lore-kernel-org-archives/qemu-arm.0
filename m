Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp233734ejb;
        Thu, 2 Feb 2023 02:03:33 -0800 (PST)
X-Google-Smtp-Source: AK7set+4lYSAGe+Hdpgz6/BeXRSYikh7vYnXIYgNQgyer1wr2jqDdk2NhDdN6aCHfXTAesxwyBAy
X-Received: by 2002:a05:6a20:d043:b0:b9:7de5:239 with SMTP id hv3-20020a056a20d04300b000b97de50239mr5999220pzb.27.1675332213101;
        Thu, 02 Feb 2023 02:03:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675332213; cv=none;
        d=google.com; s=arc-20160816;
        b=h+7j/ZD1hySHh5FDO0MokwUk7xSjKKQgTbD20j0x9NhvB0cg/LO7SiaEAA8t7lFCbS
         I02trIpvYLTvKZ8le2e125f90ykOeA8QyaHxfJaH0/5SV986Svfwd4T4uM7IsgDeL6i0
         Etk3UeT1M7xS8zgYlqhjOsXgBlP0R3ISlRzmJHeZIaY1TDt0TlZwcHUhN6eFZlA1pnmq
         ehxg+e0/lCjzjc3G3r3OR/uwa5Lcl8hDRFUV3ajwcAiYHQahYHKuVokkVk5g5aIiaE44
         7ZrMRan1WWSlt3Qh/1FUOmB1i9gXwlWgCn8pGhoxejZ7EcNNj3H3wU95p1H6rK+W4LaW
         PVtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=yR0y+MSgxpHs1wct0+/mwH7E0d7naoviLcqyb2z2qXE=;
        b=o/ZEVHkwnLzjA/DO8FJFeOYDRwq1dNVWe6IaTxXNdEDlTCyZkUXNO+g030ctrmQAdI
         glJRj1tvngK8q7SlFW0A8DAT+yE6kLcNAik9Zfr+CBrOKYaHNwZO54d3CSDnXRE0ehcl
         0SCkzQ5jxn8Ud5fnnyMVXLG15JWBD7wtQNmxJHrkqCdo5ssqJ/0Elhwk6nhFw3hY4JrC
         SnkXVkbwKJw1CTcntoKdORNPIJ3fyUh8S+ZHF+66NGKxIn94IHu8dohkSy8ubgowuh0w
         BbkdBwNMnlNy+HEDNC61Ow/FZZMDB1RWz1SgqJLV+iS1BnXoerOozTnV/mf7bTN/D/vC
         yQIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=GBxe+s50;
       spf=pass (google.com: domain of mads@ynddal.dk designates 17.58.38.53 as permitted sender) smtp.mailfrom=mads@ynddal.dk
Return-Path: <mads@ynddal.dk>
Received: from ms11p00im-qufo17281601.me.com (ms11p00im-qufo17281601.me.com. [17.58.38.53])
        by mx.google.com with ESMTPS id j70-20020a638049000000b004e4681678c1si15471686pgd.513.2023.02.02.02.03.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 02:03:33 -0800 (PST)
Received-SPF: pass (google.com: domain of mads@ynddal.dk designates 17.58.38.53 as permitted sender) client-ip=17.58.38.53;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=GBxe+s50;
       spf=pass (google.com: domain of mads@ynddal.dk designates 17.58.38.53 as permitted sender) smtp.mailfrom=mads@ynddal.dk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
	t=1675332212; bh=yR0y+MSgxpHs1wct0+/mwH7E0d7naoviLcqyb2z2qXE=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
	b=GBxe+s50e6D2x94NWvGyz1/ygWsj6IdZB8uJoukfI9N76FJMvIRd9QPFVOO6/Oio6
	 Rnk2tdjju31vpWYpz/FvWlUGD+6/1an6DCbqvmCXdlHKdeBlwU+OrwLrNhLzmj8E2j
	 XyDd/CzSjcLyBZRQ2ChGmfcygOqwoEEcYFwVmfp6WLGrmTScD6NPLr4EOUtLY4zcvo
	 eGbzZzWFr2mLIXYk1roEtbU7fEZ/e0qLdRq140ciuHPBEhKamtiZ9dFYB8YWXS9sAa
	 nw6gDi+dbMQ5pnhaViD/+0uWp4hMffxvCNSVISPt2ENeknxvV9dszoE+wC6qUm1Xjx
	 bTlJ/d3ao8lHA==
Received: from smtpclient.apple (ms11p00im-dlb-asmtpmailmevip.me.com [17.57.154.19])
	by ms11p00im-qufo17281601.me.com (Postfix) with ESMTPSA id 82357AA0645;
	Thu,  2 Feb 2023 10:03:29 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [PATCH v3 2/3] hvf: implement guest debugging on Apple Silicon
 hosts
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <CAF8_6K=7qhJc7jo2jrzYJ6_SjKnbxOd_6_6CtdKJXwfJj5onQg@mail.gmail.com>
Date: Thu, 2 Feb 2023 11:03:16 +0100
Cc: qemu-devel@nongnu.org,
 dirty@apple.com,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM cores" <qemu-arm@nongnu.org>,
 Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Francesco Cagnin <fcagnin@quarkslab.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4002D932-B7A3-4166-BA8A-5A323CD87096@ynddal.dk>
References: <20230114161302.94595-1-fcagnin@quarkslab.com>
 <20230114161302.94595-3-fcagnin@quarkslab.com>
 <5B722E51-E635-4196-8978-E0393F9EEFA1@ynddal.dk>
 <1F9A3AAD-0A5D-4E7D-A053-7F49CE019096@ynddal.dk>
 <CAF8_6K=7qhJc7jo2jrzYJ6_SjKnbxOd_6_6CtdKJXwfJj5onQg@mail.gmail.com>
To: Francesco Cagnin <francesco.cagnin@gmail.com>
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-Proofpoint-ORIG-GUID: ASxqZ596wDjN4dGR2eMLtR-jlO0pc8Vu
X-Proofpoint-GUID: ASxqZ596wDjN4dGR2eMLtR-jlO0pc8Vu
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 phishscore=0
 adultscore=0 mlxlogscore=572 clxscore=1030 suspectscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2302020093
X-TUID: aFdyAZ7viRJH


> Are you running the Linux guest on multiple cores? If yes, could you
> check if the issue persists also when using a single core?

Yes, I was running with 2 cores. I just tested with 1 and 2 several =
times. I
haven't reproduced the bug with 1 core, but happens around 70% of the =
time with
2 cores.

=E2=80=94
Mads Ynddal
