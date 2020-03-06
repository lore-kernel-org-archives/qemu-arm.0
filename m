Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp4336717lfi;
        Fri, 6 Mar 2020 07:30:28 -0800 (PST)
X-Google-Smtp-Source: ADFU+vt2PmRgD/yfUgJPD8Ap6laQPTo3GVA4Vr4gwKi57Xe5puFGhy9ZjGu3LGN8NnRUgociEKuv
X-Received: by 2002:ae9:f445:: with SMTP id z5mr3418310qkl.145.1583508628727;
        Fri, 06 Mar 2020 07:30:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583508628; cv=none;
        d=google.com; s=arc-20160816;
        b=n09sE/+WJg9G+eJW19QLyfBnMba7kXZO/AnrjTNm2Jai1mKdDxzSUOYIej2qqZ5Ree
         NfHXgf6ogkF9oWH1YANt9f4WR9MpKct0hSsv1HsmhIUAST0aUZaUUJyN3J86JgoVLxq5
         TzvXP06PKvqVfTAmWAbiAh7hWi/QFihg/5INf98W1TwlnfUBvKgj5QhSDvruUHkUytxu
         aYNqYKbH2+Hi8ntcXPNbNTA9XqzZXZl5llQgr67ybheCjMB4pLqSkjIbb2xMSGHpkzx0
         wmQVdFNgTHrtLVdsZsFleDy9V2lxvBwie5jkpH75+/Jg6/kanp2P3SNIuXNWq/SO/URL
         vOIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=JgrDWd5oUiPCJPX6ql+s6WH1iserf/Z3hueBG7jI12Q=;
        b=0Hux2bfM8oGiGah8TUT1nctMxMyZrET+jygupmOA4RvUStK6pq/9YbYMlr5SUUnELy
         YBMpqKpmi9emqflGTStTgoaRpbKYNvUBBwoU0p0UzABGtM2UEl/uqGxbBzjqQjF/O8ti
         a2SfeCYv67AOvtDncjflro6M/bu9JbZ5stLbDVp2U1SI7ZRmKRMStK4K00C2/5cHj1jO
         dlw2We54xm2BiWpBQ/zUlnjOIF24NaswIl955Mtb3aFSsA8ywwu//onOHj6Vp3NaLLRS
         qnX9etJM6XkpjHBXYAmFkuXMqgzU8N5bPdd6Rz7U5b8TFq4X4O//UJav22UYuPpvoOXC
         po4w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12si1479200qku.314.2020.03.06.07.30.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Mar 2020 07:30:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jAEvk-0004NL-5J
	for alex.bennee@linaro.org; Fri, 06 Mar 2020 10:30:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50690)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1jAErc-0006oZ-Pm
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 10:26:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1jAErb-00053i-NV
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 10:26:12 -0500
Received: from 18.mo4.mail-out.ovh.net ([188.165.54.143]:44663)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1jAErb-00050Y-1C
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 10:26:11 -0500
Received: from player731.ha.ovh.net (unknown [10.108.54.119])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 5E1F8229F24
 for <qemu-devel@nongnu.org>; Fri,  6 Mar 2020 16:26:08 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player731.ha.ovh.net (Postfix) with ESMTPSA id B1892FF23ABD;
 Fri,  6 Mar 2020 15:25:48 +0000 (UTC)
Subject: Re: [PATCH 1/6] hw/net/e1000e_core: Let e1000e_can_receive() return a
 boolean
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200305175651.4563-1-philmd@redhat.com>
 <20200305175651.4563-2-philmd@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <7fe2e414-076f-e361-f940-798613292634@kaod.org>
Date: Fri, 6 Mar 2020 16:25:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200305175651.4563-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 7750413487324892115
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudduvddgjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejfedurdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 188.165.54.143
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 Joel Stanley <joel@jms.id.au>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CIiKKmdwDmrN

On 3/5/20 6:56 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> The e1000e_can_receive() function simply returns a boolean value.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

> ---
>  hw/net/e1000e_core.h | 2 +-
>  hw/net/e1000e_core.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/net/e1000e_core.h b/hw/net/e1000e_core.h
> index 49abb136dd..aee32f7e48 100644
> --- a/hw/net/e1000e_core.h
> +++ b/hw/net/e1000e_core.h
> @@ -143,7 +143,7 @@ e1000e_core_set_link_status(E1000ECore *core);
>  void
>  e1000e_core_pci_uninit(E1000ECore *core);
> =20
> -int
> +bool
>  e1000e_can_receive(E1000ECore *core);
> =20
>  ssize_t
> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
> index 94ea34dca5..e0bafe975b 100644
> --- a/hw/net/e1000e_core.c
> +++ b/hw/net/e1000e_core.c
> @@ -967,7 +967,7 @@ e1000e_start_recv(E1000ECore *core)
>      }
>  }
> =20
> -int
> +bool
>  e1000e_can_receive(E1000ECore *core)
>  {
>      int i;
>=20

