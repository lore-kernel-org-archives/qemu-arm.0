Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2201164njb;
        Mon, 7 Oct 2024 14:22:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXGzqA0U8mzxQ0q2zZMyZ2unMDQe2AmyJQAHnAFNJlCvXgMDeGz+fclW5MknforrJLr0W/vWxVLNNQ8Bg==@linaro.org
X-Google-Smtp-Source: AGHT+IF9N0jZAPzddIsikB7NqFvj7ZNxiILoleZntM6KqO4JfXdwJ4Wp9ptR2SBJ9n53B7kuBjld
X-Received: by 2002:a05:6402:848:b0:5c8:8b0e:8658 with SMTP id 4fb4d7f45d1cf-5c905d4f718mr955599a12.14.1728336140090;
        Mon, 07 Oct 2024 14:22:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728336140; cv=none;
        d=google.com; s=arc-20240605;
        b=VzlRxj7PpxsTVPmj27bVVZPRbzv/ttrWA/VKsfedWhiiTdrdbjJKe1I2fgYc8DWA4M
         mRy4sxbSu0EJTWw81ail9LL6Z7TQ8YK3FADtrG6Bks3MHK16VvYFLjfhnvtdGsjRwBwW
         wLPQd55xaMifrnicBfuhVhsDy+uqCRSog6aDVKgrUDXpa3/ydwVWJzTOoqwJggsiCdYU
         TCJOKDM/BJB8V40BpFmevEnILQjPyty5HbUIAwztXiDg8MnrTgB8W9PBz7L9HxFBu7Dt
         sGei7PAuBV1/cKh0lwA8iwvGAF2srzd8tkC6cL0FvViJSOrXYE7AmF/VU095kZ9mtfgM
         O1EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=ui-outboundreport:content-transfer-encoding:in-reply-to:autocrypt
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=tIHVxmG19S2cuDGZ8+zG7vlOqIQyzHpg/5tuQKZv624=;
        fh=3fZ7Wohp6BUOfptJMglDqKETKOsQS3q9o/uj1RhoDNQ=;
        b=cB7ONrhVTLkq7ixUxowafNj4faQUKpOrUAo7CM89/I5owIYUZJC5V9Xt7y4U+4RBf4
         qN6ckiV9w5vQoC2z0wOtvSqPCPpf08GafpgBQvLHk4ugDNNSRS6ODEZfb1j2WyGgcAvc
         Xe4bNWg4awtGKr4FpSdpn0mTU5EGoQLe3kT8KClHSMEgI0I8vUFBPT1rj/oKH1a73Nkk
         rsbvZaxuBwYP3JecIFKAoZnIhVW3ddWLG+nrMx/0CEx2T7UnHJthSbOUnSyYFRz7D12e
         CyYTM8mmMqJmg84eCCxbViacD/5EX5bk8PN0H2U0fOsCnlYYz7N16q9FdWUT98INERl5
         dcRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=YVN2IGgk;
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.20 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
Return-Path: <deller@gmx.de>
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.20])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5c8e060dcf5si4645584a12.655.2024.10.07.14.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 14:22:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of deller@gmx.de designates 212.227.17.20 as permitted sender) client-ip=212.227.17.20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=YVN2IGgk;
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.20 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728336139; x=1728940939; i=deller@gmx.de;
	bh=tIHVxmG19S2cuDGZ8+zG7vlOqIQyzHpg/5tuQKZv624=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=YVN2IGgkR4oKLQN37AlbWtO6ZqQmh3JWciSWuIdiecewu1zpPj5sx4myASWIUqac
	 6vt5AOSz5sqUjieLTWRSh7mlesMKYSW7/0/ydgtby9ESzP60zuoS4X3FFdosQdN6r
	 KIJcsZ5lcFAsO+QAEt1Go7OXLSrZKGvU1Nt181IXLpxdzbP97cNwMW17NnH9cwBTb
	 jCMoBV2CyZrNfiRdrGpX38yWX/RJNt5NJ8I/+lyGPkb8TqfgQj7YrI/K2jGdwjno0
	 AfJQ24VbHYEjCE0RmHqpMIlJiSdX1EKsMQZd1IUggGqmxM+alsy+TIrvd2D+BGgd4
	 OAv91zvVWiDUv5+SSg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYNJq-1tTDir20dG-00Qu7A; Mon, 07
 Oct 2024 23:22:19 +0200
Message-ID: <5c141cbe-bc77-471b-8e88-643fef815815@gmx.de>
Date: Mon, 7 Oct 2024 23:22:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/21] target/arm: Pass MemOp to get_phys_addr_nogpc
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-17-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 xsFNBF3Ia3MBEAD3nmWzMgQByYAWnb9cNqspnkb2GLVKzhoH2QD4eRpyDLA/3smlClbeKkWT
 HLnjgkbPFDmcmCz5V0Wv1mKYRClAHPCIBIJgyICqqUZo2qGmKstUx3pFAiztlXBANpRECgwJ
 r+8w6mkccOM9GhoPU0vMaD/UVJcJQzvrxVHO8EHS36aUkjKd6cOpdVbCt3qx8cEhCmaFEO6u
 CL+k5AZQoABbFQEBocZE1/lSYzaHkcHrjn4cQjc3CffXnUVYwlo8EYOtAHgMDC39s9a7S90L
 69l6G73lYBD/Br5lnDPlG6dKfGFZZpQ1h8/x+Qz366Ojfq9MuuRJg7ZQpe6foiOtqwKym/zV
 dVvSdOOc5sHSpfwu5+BVAAyBd6hw4NddlAQUjHSRs3zJ9OfrEx2d3mIfXZ7+pMhZ7qX0Axlq
 Lq+B5cfLpzkPAgKn11tfXFxP+hcPHIts0bnDz4EEp+HraW+oRCH2m57Y9zhcJTOJaLw4YpTY
 GRUlF076vZ2Hz/xMEvIJddRGId7UXZgH9a32NDf+BUjWEZvFt1wFSW1r7zb7oGCwZMy2LI/G
 aHQv/N0NeFMd28z+deyxd0k1CGefHJuJcOJDVtcE1rGQ43aDhWSpXvXKDj42vFD2We6uIo9D
 1VNre2+uAxFzqqf026H6cH8hin9Vnx7p3uq3Dka/Y/qmRFnKVQARAQABzRxIZWxnZSBEZWxs
 ZXIgPGRlbGxlckBnbXguZGU+wsGRBBMBCAA7AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheA
 FiEERUSCKCzZENvvPSX4Pl89BKeiRgMFAl3J1zsCGQEACgkQPl89BKeiRgNK7xAAg6kJTPje
 uBm9PJTUxXaoaLJFXbYdSPfXhqX/BI9Xi2VzhwC2nSmizdFbeobQBTtRIz5LPhjk95t11q0s
 uP5htzNISPpwxiYZGKrNnXfcPlziI2bUtlz4ke34cLK6MIl1kbS0/kJBxhiXyvyTWk2JmkMi
 REjR84lCMAoJd1OM9XGFOg94BT5aLlEKFcld9qj7B4UFpma8RbRUpUWdo0omAEgrnhaKJwV8
 qt0ULaF/kyP5qbI8iA2PAvIjq73dA4LNKdMFPG7Rw8yITQ1Vi0DlDgDT2RLvKxEQC0o3C6O4
 iQq7qamsThLK0JSDRdLDnq6Phv+Yahd7sDMYuk3gIdoyczRkXzncWAYq7XTWl7nZYBVXG1D8
 gkdclsnHzEKpTQIzn/rGyZshsjL4pxVUIpw/vdfx8oNRLKj7iduf11g2kFP71e9v2PP94ik3
 Xi9oszP+fP770J0B8QM8w745BrcQm41SsILjArK+5mMHrYhM4ZFN7aipK3UXDNs3vjN+t0zi
 qErzlrxXtsX4J6nqjs/mF9frVkpv7OTAzj7pjFHv0Bu8pRm4AyW6Y5/H6jOup6nkJdP/AFDu
 5ImdlA0jhr3iLk9s9WnjBUHyMYu+HD7qR3yhX6uWxg2oB2FWVMRLXbPEt2hRGq09rVQS7DBy
 dbZgPwou7pD8MTfQhGmDJFKm2jvOwU0EXchrcwEQAOsDQjdtPeaRt8EP2pc8tG+g9eiiX9Sh
 rX87SLSeKF6uHpEJ3VbhafIU6A7hy7RcIJnQz0hEUdXjH774B8YD3JKnAtfAyuIU2/rOGa/v
 UN4BY6U6TVIOv9piVQByBthGQh4YHhePSKtPzK9Pv/6rd8H3IWnJK/dXiUDQllkedrENXrZp
 eLUjhyp94ooo9XqRl44YqlsrSUh+BzW7wqwfmu26UjmAzIZYVCPCq5IjD96QrhLf6naY6En3
 ++tqCAWPkqKvWfRdXPOz4GK08uhcBp3jZHTVkcbo5qahVpv8Y8mzOvSIAxnIjb+cklVxjyY9
 dVlrhfKiK5L+zA2fWUreVBqLs1SjfHm5OGuQ2qqzVcMYJGH/uisJn22VXB1c48yYyGv2HUN5
 lC1JHQUV9734I5cczA2Gfo27nTHy3zANj4hy+s/q1adzvn7hMokU7OehwKrNXafFfwWVK3OG
 1dSjWtgIv5KJi1XZk5TV6JlPZSqj4D8pUwIx3KSp0cD7xTEZATRfc47Yc+cyKcXG034tNEAc
 xZNTR1kMi9njdxc1wzM9T6pspTtA0vuD3ee94Dg+nDrH1As24uwfFLguiILPzpl0kLaPYYgB
 wumlL2nGcB6RVRRFMiAS5uOTEk+sJ/tRiQwO3K8vmaECaNJRfJC7weH+jww1Dzo0f1TP6rUa
 fTBRABEBAAHCwXYEGAEIACAWIQRFRIIoLNkQ2+89Jfg+Xz0Ep6JGAwUCXchrcwIbDAAKCRA+
 Xz0Ep6JGAxtdEAC54NQMBwjUNqBNCMsh6WrwQwbg9tkJw718QHPw43gKFSxFIYzdBzD/YMPH
 l+2fFiefvmI4uNDjlyCITGSM+T6b8cA7YAKvZhzJyJSS7pRzsIKGjhk7zADL1+PJei9p9idy
 RbmFKo0dAL+ac0t/EZULHGPuIiavWLgwYLVoUEBwz86ZtEtVmDmEsj8ryWw75ZIarNDhV74s
 BdM2ffUJk3+vWe25BPcJiaZkTuFt+xt2CdbvpZv3IPrEkp9GAKof2hHdFCRKMtgxBo8Kao6p
 Ws/Vv68FusAi94ySuZT3fp1xGWWf5+1jX4ylC//w0Rj85QihTpA2MylORUNFvH0MRJx4mlFk
 XN6G+5jIIJhG46LUucQ28+VyEDNcGL3tarnkw8ngEhAbnvMJ2RTx8vGh7PssKaGzAUmNNZiG
 MB4mPKqvDZ02j1wp7vthQcOEg08z1+XHXb8ZZKST7yTVa5P89JymGE8CBGdQaAXnqYK3/yWf
 FwRDcGV6nxanxZGKEkSHHOm8jHwvQWvPP73pvuPBEPtKGLzbgd7OOcGZWtq2hNC6cRtsRdDx
 4TAGMCz4j238m+2mdbdhRh3iBnWT5yPFfnv/2IjFAk+sdix1Mrr+LIDF++kiekeq0yUpDdc4
 ExBy2xf6dd+tuFFBp3/VDN4U0UfG4QJ2fg19zE5Z8dS4jGIbLg==
In-Reply-To: <20241005200600.493604-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2nOXmh0BYw5T8sFO7JeJaGsEOH+P9GWsjIhNEA2CG01rl0E1sRb
 jk1Mu5JUGGAopRD4Avqwg5q4yH/aUjnGz2HJLJkVQviNd+rOfNmKRFxuUGRq2I5ohnx74aC
 CwMUVfGmGoImBHJQdot12Ghc7EKcdF5kvICrVwU4/GkCtRYI3Pxfbj0W2qqoEd/0KH4drc6
 h5vGW1KkX57+MxDFy6Wew==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SJpKzYIjNRI=;J2kLbUONajuBb/T3k0Q62T1TzXT
 zgGpfmiRKytBJLqHTq5hRfApHqif0bqHXqWKGL72JXC6EF35H+Ixkedo8RGnZdM2LccQvhblw
 Qh3KxyOJaTFI8nBoLJT31PirN9kUzxfSOSWtnpbB3LOtQlZ8e37CbtFbWDb9ueMZZGJ4M1zDF
 ynEAD2j/AyGzSM4V4/t21II62TT5wOm0TE05E2+SGgnWu7mKrry+78TalAsGdYt7tX+cXPiM6
 Di9pYIJhHeuiDf+q3dV0wEh2sveyNQmFpFtyORi/k1WrBK4Tn6x2OPnHOKTj9pvxyr61Rw1Oo
 ioHdTGAzzcnUiey3VqjMXxVMStL8A0kYHcfDbwDGbRw+qg98gHCCkJvmXpe9EiLh0voC2nx4m
 ONya5vAXUELpR6i5xqzY/lJyzwhDc5fVXqaH6aVlNuJInodFa/sSRhhwXvk7cl1pI4uV2jNRD
 J8ZTEslMVX7R18wY1hopIIZvueN2GVNqlMKjrhsrX2g/bCzMsSf4Q8CG317EGVMKymKTZ85ao
 +KfT511F1WO1axuzIEbreW6/yEdJWOLgNghBK3HOrFUrelC6iuKxqFiO3qVTW3NbdlNGk/QBW
 kpCr3IUSzRrAq6D/IJYp46Rg3uZsiJdJx7bERLw9eHUJYbFXZGXbJFNB1gGfF3Q9MF83lA2ZL
 HfyZHD6MbAb9EC+6bDhdROmry5e3LM0YbtQzu5X73xROuUFKd44+BfkdCA/CsQY4DrRNvpg9k
 rAzYatxDUUlgQrqt4XkAnXcjFQuSIPbqs5SXvmGiyEQ6JAPmyjS7OfTuRQEF60qvmLTEd/3QT
 S1fL3NKHIA1BrKJBydvVthgg==
X-TUID: LCu+w0p3saAc

On 10/5/24 22:05, Richard Henderson wrote:
> Zero is the safe do-nothing value for callers to use.
> Pass the value through from get_phys_addr_gpc and
> get_phys_addr_with_space_nogpc.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Helge Deller <deller@gmx.de>


> ---
>   target/arm/ptw.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
