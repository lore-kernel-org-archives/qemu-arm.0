Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp2076761ocs;
        Mon, 26 Sep 2022 03:56:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM491qBzHRxEGbiuyuSXLm9QM7EWiKFTotezOCCTSWTGN2L/JtVFK39ig6jcDRmdmgT3sCbe
X-Received: by 2002:a05:622a:1052:b0:35c:b8e9:a8f9 with SMTP id f18-20020a05622a105200b0035cb8e9a8f9mr17348583qte.274.1664189798445;
        Mon, 26 Sep 2022 03:56:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664189798; cv=none;
        d=google.com; s=arc-20160816;
        b=DxDYL3qhBeuKCPYFSFsDc06WmcidcsSWxL6h7ExkgaPLjCsWLGWGbTFjH3V6WwLdaS
         sZX+j3lfYmwJRNAH7xicBezCqVBw4i8Z5DNlnFgtidSC91VorVQ5B2K7W9khiBunEmHn
         /rQlVntP6cMRXJBbWVJEGLw9IEVVg3+R74Cya5HZZmjybmEY/KQpRXa0bdAefl0KjuO1
         YaZzk1L7mdA5JXqWmovlLkNV4MaD+ueDVG8RWH3RR3hqphhKjttHW1ER+miV9FCVyaFO
         5BLibZHs2/j9I+qeW8aJadBhdFwCjXgLNe7uTrf0Zn/l0l8eTx0puQ0clFDpI8LhPFh1
         vHKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=17k/b9gqNcIBWr3feuuHpvs4c3ERPyupeebOSl9sZfs=;
        b=dWj8d+8JKbYoz4bk/hIkPfsTa1hF/OqFJDpWKyO1Kv20g6lZMdtrhrRhlbydNU4LLh
         s5BwfI+kTc9G5z32aQoE06CmHI4kLOmOMURYRzGibrGNbHW4tEFqf75ILCNO5t9QcGG8
         YajxtcKkvPbrvG8L56VuHukmyxa31Fwk9Bct35AmJ//uRzQSGEfhqP7ULAUKcJmymJWY
         ez1EKt6kdihY3dDpUGpCzcrMeLlTvxvR4PWvtsSEDJAqhOhHF9Lj40E3V+rC7UbSYMFd
         cavi7FWsDK5Aehm3wej3Gl5RvmpYUD1UCMWsEXOVBU6dI9OC4AGlIEXFZBrMPHvDA4FD
         F2XA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b="L//+SPWv";
       spf=pass (google.com: domain of mads@ynddal.dk designates 17.58.6.56 as permitted sender) smtp.mailfrom=mads@ynddal.dk
Return-Path: <mads@ynddal.dk>
Received: from pv50p00im-ztdg10021801.me.com (pv50p00im-ztdg10021801.me.com. [17.58.6.56])
        by mx.google.com with ESMTPS id j17-20020a05620a147100b006cdccba6fccsi6821651qkl.674.2022.09.26.03.56.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 03:56:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of mads@ynddal.dk designates 17.58.6.56 as permitted sender) client-ip=17.58.6.56;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b="L//+SPWv";
       spf=pass (google.com: domain of mads@ynddal.dk designates 17.58.6.56 as permitted sender) smtp.mailfrom=mads@ynddal.dk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
	t=1664189797; bh=17k/b9gqNcIBWr3feuuHpvs4c3ERPyupeebOSl9sZfs=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
	b=L//+SPWv+tSAj8ABhN67SpzXi4V8LwKhIRyIchKyA1Pst4/5NKy+GR1dhRQwBhJBE
	 a0kXzpN5k0/0quTMDbtoElvZju3NmmCQlJyPLwMn6shckQ057aY+pBDb3uD+y8R8rJ
	 bIhzDGxv+UIQWGkG4VvpaRx33N5rgMMuR4XoJXW4NmDYFZ/acnzk3bs3i0+kV9D5HQ
	 HnNfEYQc4gw5BuqdyZ39r0q3PiyVnXSyoQuCj8JsGevzH28+ZNl1nowuMQiGB+lzoc
	 8K86GEcBVs5fccwsZX6unXaMLhpQuf7UIpYgfhUec2rwHKSBcQozZQesyguFErRfi7
	 WM4nKTVXag1iA==
Received: from smtpclient.apple (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10021801.me.com (Postfix) with ESMTPSA id 647B41604EB;
	Mon, 26 Sep 2022 10:56:34 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH  v1 3/9] hw/intc/gic: use MxTxAttrs to divine accessing
 CPU
From: mads@ynddal.dk
In-Reply-To: <20220922145832.1934429-4-alex.bennee@linaro.org>
Date: Mon, 26 Sep 2022 12:56:32 +0200
Cc: qemu-devel@nongnu.org,
 f4bug@amsat.org,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM cores" <qemu-arm@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <85155F4E-0FFF-4DE6-A336-3F9C5B561CDC@ynddal.dk>
References: <20220922145832.1934429-1-alex.bennee@linaro.org>
 <20220922145832.1934429-4-alex.bennee@linaro.org>
To: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-Proofpoint-GUID: r5XPi0IoRuEJOqQnVv5E0zl3ShYtLZ8x
X-Proofpoint-ORIG-GUID: r5XPi0IoRuEJOqQnVv5E0zl3ShYtLZ8x
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.883,17.11.64.514.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F08:2022-06-21=5F01,2022-06-21=5F08,2022-02-23?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 clxscore=1030 malwarescore=0 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2209260069
X-TUID: +fDGQfi/GsVf



> On 22 Sep 2022, at 16.58, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>=20
> Now that MxTxAttrs encodes a CPU we should use that to figure it out.
> This solves edge cases like accessing via gdbstub or qtest.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/124
>=20
> ---
> v2
>  - update for new field
>  - bool asserts
> ---
> hw/intc/arm_gic.c | 39 ++++++++++++++++++++++-----------------
> 1 file changed, 22 insertions(+), 17 deletions(-)
>=20
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 492b2421ab..b58d3c4a95 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -56,17 +56,22 @@ static const uint8_t gic_id_gicv2[] =3D {
>     0x04, 0x00, 0x00, 0x00, 0x90, 0xb4, 0x2b, 0x00, 0x0d, 0xf0, 0x05, =
0xb1
> };
>=20
> -static inline int gic_get_current_cpu(GICState *s)
> +static inline int gic_get_current_cpu(GICState *s, MemTxAttrs attrs)
> {
> -    if (!qtest_enabled() && s->num_cpu > 1) {
> -        return current_cpu->cpu_index;
> -    }
> -    return 0;
> +    /*
> +     * Something other than a CPU accessing the GIC would be a bug as
> +     * would a CPU index higher than the GICState expects to be
> +     * handling
> +     */
> +    g_assert(attrs.requester_is_cpu);
> +    g_assert(attrs.cpu_index < s->num_cpu);
> +
> +    return attrs.requester_id;
> }

The asserts here abort on macOS, with HVF accelerator:

ERROR:../hw/intc/arm_gic.c:66:gic_get_current_cpu: assertion failed: =
(attrs.requester_is_cpu)
Bail out! ERROR:../hw/intc/arm_gic.c:66:gic_get_current_cpu: assertion =
failed: (attrs.requester_is_cpu)

If I revert the changes inside this function, it seemingly works again.=
