Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp2999649ejx;
        Mon, 7 Nov 2022 05:29:05 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5ti68JNi1sozoql3rGbyQ5L+OS1RsCvLXvwnCHD15KI3gIlkwhjY3WzHmFWzJhD49ixW4E
X-Received: by 2002:a17:90b:1982:b0:212:fe7f:4a49 with SMTP id mv2-20020a17090b198200b00212fe7f4a49mr69484595pjb.156.1667827745175;
        Mon, 07 Nov 2022 05:29:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667827745; cv=none;
        d=google.com; s=arc-20160816;
        b=QJBPn+Y4qWkSj3LeOCKKf5GZ62eyuLG6yUigLaeRyjcMdllstprPQiawWTa8Y02Iwd
         vnd88cqKuk1LoK4/3TUzdGMkJmRn0gFoogbvCW0KWTv8NfD3bPiBYcugzNc9WZ58V2dW
         uHzaFYo5DxtLHwqp2ia4TZ2WC0vwOfbrKtlGWWBieuDlf4aAC+ys10gaEFij7UbaHdQN
         0/24MklLc7d7aI0hf6QP0+ObXk8K/pIxQTHp+W99ATX7A9b9z5yZASC1K+jxJ9/IXKaR
         2oKYY1oYSXCwmAZZ3A1tHs2kRtQWnifRSQ5tDZpEWD7DWvNjQq5FA/5zhxC6ItRcYqxh
         D3OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=rPCCkICtGd7upsfHv1KYr6ShqHuTrPCWLNYdk6joyx4=;
        b=eQ7kRdq0SEkz6aMKAg3mDoGarR2jOobSdX+h5aaCPIM/r0mwA8tSUjZEsW3OR5bYk/
         mshIQ4a3zi3rRw3g1dFPIqP5mMwqhPQOwixlnBWgIpF6DnIhes2SQd/xoaJgUQ8p/azQ
         pHsqm1GJIevug9fNtcLokmSARSGXN+MWoZGm+8a96RIY8Pg+cCm1X59lb30PBM5sRo2O
         sj1Z/vTAxYP4EbYDlIpE+MGXJ0KIl3YnPLuocinnzVqttmYWjaOzDHVq1d6o8jhuqbaZ
         SfWJsXUEKf1O9fxonQTnA8N/V3xIZ/AlH3rG87sktWigRHBDj+0li+P8WjDLmM9l3oP/
         oTHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=fIuwI7Sz;
       spf=pass (google.com: domain of mads@ynddal.dk designates 17.58.23.181 as permitted sender) smtp.mailfrom=mads@ynddal.dk
Return-Path: <mads@ynddal.dk>
Received: from mr85p00im-ztdg06011201.me.com (mr85p00im-ztdg06011201.me.com. [17.58.23.181])
        by mx.google.com with ESMTPS id n2-20020a170902d2c200b0017a0e8713cesi12156267plc.452.2022.11.07.05.29.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 05:29:05 -0800 (PST)
Received-SPF: pass (google.com: domain of mads@ynddal.dk designates 17.58.23.181 as permitted sender) client-ip=17.58.23.181;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=fIuwI7Sz;
       spf=pass (google.com: domain of mads@ynddal.dk designates 17.58.23.181 as permitted sender) smtp.mailfrom=mads@ynddal.dk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
	t=1667827744; bh=rPCCkICtGd7upsfHv1KYr6ShqHuTrPCWLNYdk6joyx4=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
	b=fIuwI7Szr/gLe/aQV809Qgt6RBVnQRXuLOOYE/fDEHGa9rtB45DYxlDMQtAsQbO96
	 /Ejsm9gTb2MhdwdiPe7xYAXVKZ4DPjSRpPE66W14STlgONZ7mN95N/kxBkd1zc0WHA
	 hO2TyQg3ZEBvF6mbzOO50IDN3dIrjfgqlhxs47wZkeB4KQtglKo4z9uVPMV04a7ygL
	 pkWTpo5ThiyGhsZB5hW1/JNQZVQTkJUKtE2B3tasVGnyJYiwVHqK71vZsD/j0A6/Ht
	 ZHWcv9jCywi8HRcDbw+TtC7VsB1zu9KNAmWUa6CHsB+dl+3iZzlvxcLtp/Zs3qrGK8
	 BuICEcaAHSqqw==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
	by mr85p00im-ztdg06011201.me.com (Postfix) with ESMTPSA id 703E8960B5C;
	Mon,  7 Nov 2022 13:29:01 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH 2/3] hvf: implement guest debugging on Apple Silicon hosts
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20221104184101.6923-3-fcagnin@quarkslab.com>
Date: Mon, 7 Nov 2022 14:28:48 +0100
Cc: qemu-devel@nongnu.org,
 dirty@apple.com,
 r.bolshakov@yadro.com,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM cores" <qemu-arm@nongnu.org>,
 Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Francesco Cagnin <fcagnin@quarkslab.com>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2B918171-9464-40DC-AE11-D25E60858370@ynddal.dk>
References: <20221104184101.6923-1-fcagnin@quarkslab.com>
 <20221104184101.6923-3-fcagnin@quarkslab.com>
To: francesco.cagnin@gmail.com
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-Proofpoint-GUID: zm_MDPl4QMKgHiIh4cGBNFDP-AI3WOiM
X-Proofpoint-ORIG-GUID: zm_MDPl4QMKgHiIh4cGBNFDP-AI3WOiM
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=736 adultscore=0 phishscore=0 clxscore=1030 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2211070109
X-TUID: D0nkzJa5FUVT



> On 4 Nov 2022, at 19.41, francesco.cagnin@gmail.com wrote:
>=20
> From: Francesco Cagnin <fcagnin@quarkslab.com>
>=20
> Support is added for single-stepping, software breakpoints, hardware
> breakpoints and watchpoints. The code has been structured like the KVM
> counterpart (and many parts are basically identical).
>=20
> Guests can be debugged through the gdbstub.
>=20
> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
> ---
> accel/hvf/hvf-accel-ops.c | 124 ++++++++++++++++++++++++
> accel/hvf/hvf-all.c       |  24 +++++
> cpu.c                     |   3 +
> include/sysemu/hvf.h      |  29 ++++++
> include/sysemu/hvf_int.h  |   1 +
> target/arm/hvf/hvf.c      | 194 +++++++++++++++++++++++++++++++++++++-
> 6 files changed, 374 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/sysemu/hvf.h b/include/sysemu/hvf.h
> index bb70082e45..3e99c80416 100644
> --- a/include/sysemu/hvf.h
> +++ b/include/sysemu/hvf.h
> @@ -1180,6 +1201,9 @@ int hvf_vcpu_exec(CPUState *cpu)
>=20
>     flush_cpu_state(cpu);
>=20
> +    r =3D hv_vcpu_set_trap_debug_exceptions(cpu->hvf->fd, =
trap_debug_exceptions);
> +    assert_hvf_ok(r);
> +
>     qemu_mutex_unlock_iothread();
>     assert_hvf_ok(hv_vcpu_run(cpu->hvf->fd));

We don't need to set this at every call to `hvf_vcpu_exec`. Would it =
make sense
to move it to `hvf_arch_update_guest_debug` or even =
`hvf_arch_init_vcpu`?

(CC'ed Alex Benn=C3=A9e as we discussed the GDB stub in HVF at KVM Forum =
2022)=
