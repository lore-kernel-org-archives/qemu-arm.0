Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp205393ejc;
        Thu, 19 Jan 2023 01:50:04 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvfynzRWv5WEIBw2pCnoTYvgfVAbn0o8CHtaPbF3nMVq81Cr/Mm6xCor/kedBOYGxtx2GPy
X-Received: by 2002:a05:6402:d0:b0:49e:746f:adfa with SMTP id i16-20020a05640200d000b0049e746fadfamr812052edu.31.1674121804021;
        Thu, 19 Jan 2023 01:50:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674121804; cv=none;
        d=google.com; s=arc-20160816;
        b=y4JTMQSEpV91fwSoiC9PFb6P0jT2wFoi7PH4M3wHl7/GBqbWfL9P2KETabxb8sF5RC
         QgjcfTINDF1U6Gg9Rkq4HU1TvcEoehUJ17QHmnr3deqC8+WTHmX3giu/F/2gcAtTUUlJ
         TjNrqhmbKuMFkCDrW3kEN4oDp4qL/XxDPkKotNq2eZQMvlQJLMEMjHAEHMJgLTZF+vlZ
         7fp6b5uEG3dYEH+gi/QXvCv7TK5eBk4MLgxmsNL8pOZAcZaarPpGLw+qWuy07tfq0FXW
         VOv0wc7Rhz+3q6UsadRyX/u+sLwUI5iqCPQ9W4VtdZ3JLNks4tqlGFI7EW+ze80lMZOt
         wzKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=u5gMT2bw7+a6l2mNPMYtmJZqCrjqHEhjfNWpsXV7rYw=;
        b=jJt4wZ+dyPxFgBvS62d1BeTvovi43uxQe3dSFoKbxG0NoJ4FBCwL/+ccGvNvhWtElF
         lx4/D3ZjRM4mWZC1l++ORhpGoybw0E8MbF6wMtRFkggSkC0IJJRlN83BDePm5x0IdV0Q
         R8R2GtxZPzdP7R0LUrb2UyF3oGB7gXxSgXbbC4FhbsgbH2jU7FEny2nkZ0cKtiY7+MtW
         g/0XzkEE84EtbsJFQqywaxptMLHMpuHgSHbiyas/dSryYkLk9Jh2NUsoOTtx1KLV/OWq
         vpmUNsXIsJRm8tQ1bXAhhIc9MipZKQ3lv6xomFF3+GIF4uLRaorNAdOjYukNyzRhXfIn
         h5Lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=dI8uEZvN;
       spf=pass (google.com: domain of mads@ynddal.dk designates 17.58.23.180 as permitted sender) smtp.mailfrom=mads@ynddal.dk
Return-Path: <mads@ynddal.dk>
Received: from mr85p00im-ztdg06021101.me.com (mr85p00im-ztdg06021101.me.com. [17.58.23.180])
        by mx.google.com with ESMTPS id z8-20020a056402274800b0049e429bdbe2si8284216edd.475.2023.01.19.01.50.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 01:50:03 -0800 (PST)
Received-SPF: pass (google.com: domain of mads@ynddal.dk designates 17.58.23.180 as permitted sender) client-ip=17.58.23.180;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=dI8uEZvN;
       spf=pass (google.com: domain of mads@ynddal.dk designates 17.58.23.180 as permitted sender) smtp.mailfrom=mads@ynddal.dk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
	t=1674121802; bh=u5gMT2bw7+a6l2mNPMYtmJZqCrjqHEhjfNWpsXV7rYw=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
	b=dI8uEZvNCdo2kjXfLrr+sc2w10+4Q9tDgQPc1wVYHrSJzB82kV1u0atYeafVgFOaN
	 sH+k/fZ4sOylKdH3WBq9qZ9ZLIT39KHOy1bYFER2hZxa1zVTubFZ2vYqixHA4dcWfn
	 gXhiR5xFqjYkCX7U2VL5JmqpxlImbz+nztP7FTuIxH5GCl5gNT4wB+ZR5weHPORBAp
	 phe52XEpmTV60dW6Yhy6NdNSb3pF7a8/XlMYPCbKsSQpX91XcnLHHsyO/e9rrwcKg6
	 Wbx71vHuJtSD3PvfuBLCDH0EXB5VQDF65jwQ9eskg3ULlEZZykN2hccdcdiQTslRpl
	 4UNv7CUwLyIlA==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
	by mr85p00im-ztdg06021101.me.com (Postfix) with ESMTPSA id 3EDEE80E33;
	Thu, 19 Jan 2023 09:49:59 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [PATCH v3 2/3] hvf: implement guest debugging on Apple Silicon
 hosts
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <5B722E51-E635-4196-8978-E0393F9EEFA1@ynddal.dk>
Date: Thu, 19 Jan 2023 10:49:47 +0100
Cc: qemu-devel@nongnu.org,
 dirty@apple.com,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM cores" <qemu-arm@nongnu.org>,
 Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Francesco Cagnin <fcagnin@quarkslab.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1F9A3AAD-0A5D-4E7D-A053-7F49CE019096@ynddal.dk>
References: <20230114161302.94595-1-fcagnin@quarkslab.com>
 <20230114161302.94595-3-fcagnin@quarkslab.com>
 <5B722E51-E635-4196-8978-E0393F9EEFA1@ynddal.dk>
To: francesco.cagnin@gmail.com
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-Proofpoint-ORIG-GUID: 0qHokcueEKGioRftouPYTpLRtg6ynoIQ
X-Proofpoint-GUID: 0qHokcueEKGioRftouPYTpLRtg6ynoIQ
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.816,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-18=5F01:2022-01-14=5F01,2022-01-18=5F01,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=474 mlxscore=0
 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 clxscore=1030 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2301190078
X-TUID: 9jZlbCCqohMg


> It seems v3 has a regression in regards to BRK instructions that I =
cannot
> reproduce with v2.

I've now observed the same messages on v2 on a co-worker's computer. =
Maybe it's
happening in combination with another commit on master. If I can find =
the time,
I'll try to bisect it.

=E2=80=94
Mads Ynddal
