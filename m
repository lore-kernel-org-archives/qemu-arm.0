Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2499608lfk;
        Mon, 31 Jan 2022 12:13:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyMXGMB66a7q4XD4miaPUPFl84NMkYlZAVVJ8W6RIQt2Inac9n/p7nM+d2nbdUrMxkJ205
X-Received: by 2002:a17:903:2301:: with SMTP id d1mr22721780plh.26.1643660023713;
        Mon, 31 Jan 2022 12:13:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643660023; cv=none;
        d=google.com; s=arc-20160816;
        b=Olv49bIlrfwCVBkHMFiIjpiW8QjlYgkCo+dUswuqAvJBULRO8pJtSyasHMQu9M+Q8z
         X2Ll02ahvZWkB/Y+VfOJ4DiML6myfXSMBBM5WRUI9CxxrY/8Amwo1v7jnl4HbYcEEdJU
         HOmVBQmb6fseAXkTPe9IpAIR7mRpgIgd+waXr9MaWTDVc/70ngK0qrzErvb8mi8Z/QV6
         bLRebnWbAn1eBlCz8DGnI7JpCb+mAVTfiZo6hrPNylIyTgU8ydqQ2FnWkR7Xjf0Cd8vo
         nUyKBTeQHcJS/Nf/wAfsf4PBn+vi3ZjtSsgXYIE2T4qPrhg0Lgyqh8W0SjbzwS/rUMnF
         okng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=yMgBhqnhh0PG4FmOEWK8W0UoSw/22A3ARwBJPqYuWSYWp0j/JM16xePHp8D8XOdY64
         FxaacRuE5AmzlL2zPNndNrX/a3Okt1c3shebfcdPyR8Q/FYmZ6TxyhwJTPBXfQjaqV+0
         G8hzSUKdJG4EwF0/MfwcvZyDYetydl5gDSEDM1I3WOYufZnhHvVabhscnVenZY21RDMu
         Zr409E6TyXAtIISmjQfdr7gXyCeydoH9H+a62SYQAEvC8qkzvAgLSltEDlKJAMukhjZf
         1mX09ZveY5GqWblC/V9rnpMWQyysNTxgVW5kreLr5q5VN42jjZQDlEOY0b0a9ZMCqgDW
         y+gA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vasilev.oleg@huawei.com designates 45.249.212.187 as permitted sender) smtp.mailfrom=vasilev.oleg@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <vasilev.oleg@huawei.com>
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com. [45.249.212.187])
        by mx.google.com with ESMTPS id f67si14579283pgc.123.2022.01.31.12.13.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Jan 2022 12:13:43 -0800 (PST)
Received-SPF: pass (google.com: domain of vasilev.oleg@huawei.com designates 45.249.212.187 as permitted sender) client-ip=45.249.212.187;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vasilev.oleg@huawei.com designates 45.249.212.187 as permitted sender) smtp.mailfrom=vasilev.oleg@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from dggpeml500021.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JnfPW6BD4zccld;
	Tue,  1 Feb 2022 04:12:47 +0800 (CST)
Received: from dggpeml500023.china.huawei.com (7.185.36.114) by
 dggpeml500021.china.huawei.com (7.185.36.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 1 Feb 2022 04:13:42 +0800
Received: from dggpeml500023.china.huawei.com ([7.185.36.114]) by
 dggpeml500023.china.huawei.com ([7.185.36.114]) with mapi id 15.01.2308.021;
 Tue, 1 Feb 2022 04:13:41 +0800
From: Vasilev Oleg <vasilev.oleg@huawei.com>
To: Oleg Vasilev <me@svin.in>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>
Subject: Re: [RFC PATCH 1/2] target/arm: move regime_ttbr helper
Thread-Topic: [RFC PATCH 1/2] target/arm: move regime_ttbr helper
Thread-Index: AQHX91QLoO0Anzq6a0eSuPmah3gWdA==
Date: Mon, 31 Jan 2022 20:13:41 +0000
Message-ID: <0e02f13052ac4e50be500c2d63579021@huawei.com>
References: <20211222164947.634759-1-me@svin.in>
 <20211222164947.634759-2-me@svin.in>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.47.163.112]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: Zkv5DA3bNRT/
