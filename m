Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5115213lff;
        Mon, 13 Jan 2020 22:28:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqykGpRznvKfok349xUv7v9kQ0BGRWBeHNdPafzffR0DKQme3gzNL6fCr22SSgvCpk0QEdG+
X-Received: by 2002:a92:b744:: with SMTP id c4mr2015640ilm.34.1578983325046;
        Mon, 13 Jan 2020 22:28:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578983325; cv=none;
        d=google.com; s=arc-20160816;
        b=gajRh0vjb8nwXNdhbH60HyUB1vB/+C4OhmTBZk7ZyEMuagatNece6UWpD8pEQLABgM
         9JcCNtQzbQbYg0gRdRBP8xFDGBztFdfmt94e3E4XAa7noXZ5ihS2LI+oaEizwH82AhBL
         b+A7cefaZBdpmkxdtaEbnCu1TIIZLXRzlfSo4iU1Cz526X1ZNwfZL4psc5ueXmJuBmT4
         iR0KZHnfy92auepIYE0Vi+z97Ds8CYN02g9gbECkYuWuJhrmoA6TEW91GqhPuhZ9+LWs
         YW6uwjiBJq+fHS0ACaXme+FxW8YyUEl/TwMlXdOsxHXfLwn3z9BUP02VhBr6fB7gk7Pt
         Yc5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:date:cc:to:from:subject
         :message-id;
        bh=8jAPHchI+qRpZz9+FhfuVuUYVEiTUGJtVntqkjqX3JY=;
        b=UPPLIDAI/JaUNcDOUXr2xmScMIV9H0c5KLZdSr+5oLbuMzzRHPtXI+G2cUfD24WEMk
         FCDuSBJah/4VjkJTQj75QoYmmm2BKLBcvQzFQm1XcCmsoSdDbO+olidcG9uNaMvys8C9
         pUSEjoxzO/4wP+uhALWXnIwWWpXrhAXEMsdJwJjoSwiY4ik6rj1d8WO+ll4d4XE70pJx
         NCgibCK7PvCDldxtLIlcXppYzFdN6TVicHYUo+/Vp6t2ciMcjzyGqeF35LE56b4p6o7c
         Py7BW8lVp44WZ56UoXaQ/qigxIR3jD5Wvb83WiWrYZkcd0PRLNm7IGeX0gr9NNa1EIoe
         es3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of benh@kernel.crashing.org designates 76.164.61.194 as permitted sender) smtp.mailfrom=benh@kernel.crashing.org
Return-Path: <benh@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org. [76.164.61.194])
        by mx.google.com with ESMTPS id p9si13065110ilc.44.2020.01.13.22.28.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jan 2020 22:28:44 -0800 (PST)
Received-SPF: pass (google.com: domain of benh@kernel.crashing.org designates 76.164.61.194 as permitted sender) client-ip=76.164.61.194;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of benh@kernel.crashing.org designates 76.164.61.194 as permitted sender) smtp.mailfrom=benh@kernel.crashing.org
Received: from localhost (gate.crashing.org [63.228.1.57])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 00E6Q1fA032280
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 14 Jan 2020 00:28:33 -0600
Message-ID: <11d88b2741eac3f634d5aed9e3355c974b533f7b.camel@kernel.crashing.org>
Subject: Semihosting, arm, riscv, ppc and common code
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: qemu-devel@nongnu.org
Cc: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, keithp@keithp.com,
        qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 14 Jan 2020 17:25:59 +1100
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TUID: Ll/KxIsCYeru

Hi Folks !

So I started "porting" over (read: copying) the arm semihosting code to
ppc to mimmic what Keith did for risv (mostly for picolibc support).

I noticed that the bulk of arm-semi.c (or riscv-semi.c) is trivially
made completely generic by doing a couple of changes:

 - Make most functions take a CPUState instead of the architecture
specific "env"

 - Provide arch helpers to retreive the op, set the result, do the
flen bug hack and possibly a couple of others (I'm not done yet).

There are other archs who do semihosting completely differently but at
least those 3 can share code.

Any objection/comment on the approach ? What I'll probably do is get
things going first with my ppc version (which I made more/less generic
but still located in target/ppc) at which point I can post an RFC so
you get an idea, and we find a good location for it.

From thre we might consider fixing some of the worst crap in there
doing backwards compatible extensions if we care enough :-)

Cheers,
Ben.

