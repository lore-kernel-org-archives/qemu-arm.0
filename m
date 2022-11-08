Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3828782ejx;
        Tue, 8 Nov 2022 03:51:57 -0800 (PST)
X-Google-Smtp-Source: AMsMyM48isayMrNFYtMLuUrN5ZJs06PWjhMhQbrhyV4eMXsYeLk8tYYMU0C8kfAK9I+wEmhLcuq1
X-Received: by 2002:a05:6a00:2187:b0:56c:7e85:c8f9 with SMTP id h7-20020a056a00218700b0056c7e85c8f9mr55964219pfi.75.1667908316789;
        Tue, 08 Nov 2022 03:51:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667908316; cv=none;
        d=google.com; s=arc-20160816;
        b=uhwt/UB3JBYJY9uEPX3njZ7gfztaR/+mKIaFh/MoeEWOpv8u8/d3/lxXkxoAJSz5A9
         m+N6v3VtO+PfJvL/jo24O4LdyrKBV0ttx/cgh0g2w9BSXMPy/0Bz75gYnHgw3g/l66E+
         1AoUSoSE+ThtvfiphB8iZJfV9FqDOXVc6eGbe/PayQVH333qiTnOhCACJU6/4QJSqEj3
         1VCl/ZnyU3yrDcQfBzXXBVfAUU2+Ho2xha012XK9IjedWVkdaKqhnBk3dJaECEfDW1DF
         ASRDBH1hjewDPw7XQRa6TGupQDcKltAKzUjVbnQgPTZf3fd9VprbWOflq5vDngnEK4h6
         453Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=JCTM5SiYYPq6yh9nFLgxzl9PF+cu3+MmyRLsirAgEFU=;
        b=svLeFP70OtyqnBSLPmBZmw/ijrlApLiaZDRnnZJpCHTmVeqGOzsdt3I9XHrtigc+um
         vtidBGUGIaynUnpiJeZ+4FbOGwWNigchpgnPNUrbq/TbnhwQSOEibGWZqYRbscRByexa
         itWJT/t4c/M5DkA03OCOc6ZFWY4TTj9t2Jn4ipZL56TaSRtEeg+r3wYV+rxgIyoqw1Kn
         UkzqgULss3piI/+quuXh3aPfCtg5lNkeovnIrcwxGKtmGCV0Fn8mnA9sLBBfIT1Btvav
         NN80Xq0lMVVrWaKId74lk+LA2Px6i11NhjXlRefY2C6gcTlEq/jPHYJMksa9SMlSJXri
         hvhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=hQ2GWwqi;
       spf=pass (google.com: domain of mads@ynddal.dk designates 17.58.23.185 as permitted sender) smtp.mailfrom=mads@ynddal.dk
Return-Path: <mads@ynddal.dk>
Received: from mr85p00im-ztdg06011101.me.com (mr85p00im-ztdg06011101.me.com. [17.58.23.185])
        by mx.google.com with ESMTPS id k6-20020a636f06000000b0046f9f498732si15042451pgc.303.2022.11.08.03.51.56
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 03:51:56 -0800 (PST)
Received-SPF: pass (google.com: domain of mads@ynddal.dk designates 17.58.23.185 as permitted sender) client-ip=17.58.23.185;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=hQ2GWwqi;
       spf=pass (google.com: domain of mads@ynddal.dk designates 17.58.23.185 as permitted sender) smtp.mailfrom=mads@ynddal.dk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
	t=1667908316; bh=JCTM5SiYYPq6yh9nFLgxzl9PF+cu3+MmyRLsirAgEFU=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
	b=hQ2GWwqikwy7MCG7buzz2EV5kh0RfF9ZpeasmLqs+pRRk6B5G0GzuonNbZVF9AR8W
	 R8CbQuU6Ijm9o2Emjn0UWnp68JamuCNojY2HQayk5fTxEf425l1BNIB7r7YgdxfDy3
	 p0TF5h12aOCpSpb4jD8ovU4ElwXPQHdSBW1eDQUJM1plq8/anOjRjnLAxPtnNI0Zgc
	 6+m/XzOkFlXEjzLiHY+NWuyOleAgZPbpJ/BNRNZrZ8zoJGaiiMYnMH/1FH7oTvs1vZ
	 VuzICSKk1YdM6bbKSwqiHcg2ZtDZtcb8xaBKKCuNzjKQFramFNZ+7eTsraVZzIbXJl
	 gBPMrHfVUl2oA==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
	by mr85p00im-ztdg06011101.me.com (Postfix) with ESMTPSA id 69D77DA08D8;
	Tue,  8 Nov 2022 11:51:52 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH 2/3] hvf: implement guest debugging on Apple Silicon hosts
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <CAF8_6KmwMCiNcC-romHoGZhcpPph71b3qv7yn9RHQArV3Q+nDA@mail.gmail.com>
Date: Tue, 8 Nov 2022 12:51:39 +0100
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
Message-Id: <D86C8F4E-517E-4ECC-A66D-E57F551FFECF@ynddal.dk>
References: <20221104184101.6923-1-fcagnin@quarkslab.com>
 <20221104184101.6923-3-fcagnin@quarkslab.com>
 <2B918171-9464-40DC-AE11-D25E60858370@ynddal.dk>
 <CAF8_6KmwMCiNcC-romHoGZhcpPph71b3qv7yn9RHQArV3Q+nDA@mail.gmail.com>
To: Francesco Cagnin <francesco.cagnin@gmail.com>
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-Proofpoint-GUID: W2waGQyuLClpt6apUlHKVOTXTiDdQh4I
X-Proofpoint-ORIG-GUID: W2waGQyuLClpt6apUlHKVOTXTiDdQh4I
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.816,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-18=5F01:2020-02-14=5F02,2022-01-18=5F01,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 clxscore=1030
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2211080067
X-TUID: afIO2Xfuyse/


> On 8 Nov 2022, at 11.09, Francesco Cagnin <francesco.cagnin@gmail.com> =
wrote:
>=20
> Mads, thanks for the review and feedbacks. I worked on this a few =
months
> ago but only managed to have it published now, I'm sorry for work =
being
> done twice.
>=20
> I'll add support for SSTEP_NOIRQ as you suggested.
>=20
> For multi-core systems there's no particular issue, just I'm not
> familiar with all of these topics and I'm asking for good practices. =
KVM
> saves breakpoints information in struct 'KVMState', and following the
> same approach I've updated struct 'HVFState' to store equivalent data.
> To keep separate information for each cpu, KVM uses field 'kvm_state' =
in
> struct 'CPUState' (see 'include/hw/core/cpu.h'), but at the moment
> there's no analogous field for the HVF state (which is instead defined
> as a single global variable in 'accel/hvf/hvf-accel-ops.c'). Should we
> add a new field to 'CPUState' for the HVF state, or take a different
> approach?
>=20
> For your last question regarding =
`hv_vcpu_set_trap_debug_exceptions()`,
> I think it's possible to move it to `hvf_arch_update_guest_debug()` =
but
> I'm not confident about `hvf_arch_init_vcpu()`, I will experiment =
again.

You're welcome. And that's ok. It's just unlucky timing.

In my version, I added the sw breakpoints to `hvf_vcpu_state` so they =
would
follow each CPU, but it's effectively a copy of the global set of =
breakpoints.=20
I'm no expert on QEMU, as this would have been my first contribution, =
but AFAIK,
KVM will also add the breakpoints to all CPUs as we can't know which CPU =
will
take a certain process.

Moving it to `hvf_arch_update_guest_debug` would probably be best. =
Having it in
`hvf_arch_init_vcpu` would mean that it's always enabled. In some =
corner-cases,
that might have an adverse effect.

I also noticed you are adding 1 to the WRPs and BRPs. As I interpret the
documentation, you should subtract 1 instead, given the value 0 is =
reserved:

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index dbc3605f6d..80a583cbd1 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -39,11 +39,11 @@ static void hvf_arm_init_debug(CPUState *cpu)
 {
     ARMCPU *arm_cpu =3D ARM_CPU(cpu);

-    max_hw_bps =3D 1 + extract64(arm_cpu->isar.id_aa64dfr0, 12, 4);
+    max_hw_bps =3D extract64(arm_cpu->isar.id_aa64dfr0, 12, 4) - 1;
     hw_breakpoints =3D
         g_array_sized_new(true, true, sizeof(HWBreakpoint), =
max_hw_bps);

-    max_hw_wps =3D 1 + extract64(arm_cpu->isar.id_aa64dfr0, 20, 4);
+    max_hw_wps =3D extract64(arm_cpu->isar.id_aa64dfr0, 20, 4) - 1;
     hw_watchpoints =3D
         g_array_sized_new(true, true, sizeof(HWWatchpoint), =
max_hw_wps);
     return;

But the documentation is a bit ambiguous on that. Maybe we can test it?=
