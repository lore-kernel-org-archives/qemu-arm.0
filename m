Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp464959ejv;
        Wed, 27 Mar 2024 06:34:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXp/KEUn6UHysw+otyqe3d71nX9XuAqgG7unCgQKyUy4734W1elRkQINxJCEDKTm2qyxj0U952hvY/sDm9eHBl6h58KTXNU
X-Google-Smtp-Source: AGHT+IGkXA3YB5IJlq03b0Clyf9KUg5MXOmmsTlFpQBHD0qeRPrrAqDC1akXrSdmAbEOLfUkic8B
X-Received: by 2002:a5d:60ce:0:b0:33e:cc16:387 with SMTP id x14-20020a5d60ce000000b0033ecc160387mr1145586wrt.54.1711546462621;
        Wed, 27 Mar 2024 06:34:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711546462; cv=none;
        d=google.com; s=arc-20160816;
        b=MTvb/23+vVn+hCovVLRVENWuYFVrTbMQQNuCNkWvGKmkR61ivMSw68bkpBFXPDyntv
         eT8hriNQA77DVnMn+Ki8xnvNoUpdNx8Am/j4NMwYuSd7erW12FnLGc44j8bXmHl7fNpZ
         NFuRTRD6i/mMA8OJhDx5XozSNaYVNIKGnM6ZZ9uuE3XSW4/RuoiuTqlVyQBqExEifLIq
         0k5cL2gcKWxc4mGk9hFoC2s0cKDoMKKD6Nt2JAzWbr8+5s+AAw3tPzdEi9q74AFXE4zu
         xEcsnnYo1bR8f0oNFMYEGHoLSnSqzEORWQHZdZBkhE8TivZ/xzzBcGMKd+VRuOx7igvo
         JKwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:dkim-signature;
        bh=a+mnVz+I2LBdh7f3Jeku0JCwAoJyIxFVfnocz+i6RMc=;
        fh=6wTFD3MyiH/Jpyi+8WksM5feN42/MbxjcAo32SeVa0s=;
        b=FOXp+2ru/RU2HIQDOWCIzgl/PIed+s1lXK6H3I0rWyg8l+mUgdnhFVNktIbzQiN2IL
         2ej53CL4eOdfERjAnE/885/ZE62XiLXcyJcMo+btSs7ZzUFlHA0mhBPXbqylrzebK78o
         trzoNa71Iduhi6dHqDenLV+I2abW1JvQZjH1YVja0VaOMZM9Es+oNoOOhSQf58my2xOu
         a4Nm6YfslMf6MRq88vJbSbaRB5kWyN6s8Z/ZKxWHAsuAUl8HeX5D+5eqxst6Efqvl+pq
         ZsJjMU/a5fxlGDEZOmDo5uXPm9mCm4IRvqAiBT99tTQpKXxG8RoXrfvoVU1t4crdqmN8
         UhmA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=desiato.20200630 header.b="q+v5/FPb";
       spf=none (google.com: desiato.srs.infradead.org does not designate permitted sender hosts) smtp.mailfrom=BATV+cb512937bb1ca346be0c+7521+infradead.org+dwmw2@desiato.srs.infradead.org
Return-Path: <BATV+cb512937bb1ca346be0c+7521+infradead.org+dwmw2@desiato.srs.infradead.org>
Received: from desiato.infradead.org (desiato.infradead.org. [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by mx.google.com with ESMTPS id d15-20020adfe84f000000b0034180e8ec09si6526570wrn.972.2024.03.27.06.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 06:34:22 -0700 (PDT)
Received-SPF: none (google.com: desiato.srs.infradead.org does not designate permitted sender hosts) client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=desiato.20200630 header.b="q+v5/FPb";
       spf=none (google.com: desiato.srs.infradead.org does not designate permitted sender hosts) smtp.mailfrom=BATV+cb512937bb1ca346be0c+7521+infradead.org+dwmw2@desiato.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=a+mnVz+I2LBdh7f3Jeku0JCwAoJyIxFVfnocz+i6RMc=; b=q+v5/FPbwtAD6uQ9dCHGbJREjz
	H800nx781N9tH0ZcPPk9yn5Ape1VheAXWcyBkwRNqKh4v/J6DHpXEnVP9Qz74WQNMJbQVIsdax39L
	DlLF3RislEyl4kLLjeTkS7dO2SAN6YZChYNLRkkTF2vkDLvc9T3y0pW/3wF6+9ZO7wnocnQ00G53r
	KBhD2vc3Jo90OAxsDRunIY0TlD0Q9Lwepy7zWNB83EJpkEV4zhYDQ6il5F8K101e8mWUJhr+G9rSb
	4A+Q6ifEF4oA7e6058Z6Vrd6MQkld5/dNz/qhri2QxMR/MFmkWIOk/jAPxDKuKeFdMgjEPMoFD8rB
	Bv2BC0qg==;
Received: from [2a00:23ee:1868:3da7:4441:744d:10c:c781] (helo=[IPv6:::1])
	by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpTQ2-00000000H0t-3z9v;
	Wed, 27 Mar 2024 13:34:19 +0000
Date: Wed, 27 Mar 2024 13:34:14 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Anthony PERARD <anthony.perard@cloud.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
CC: David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 Paul Durrant <paul@xen.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org, kvm@vger.kernel.org,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH-for-9=2E0_v2_?=
 =?US-ASCII?Q?09/19=5D_hw/block/xen=5Fblkif=3A?=
 =?US-ASCII?Q?_Align_structs_with_QEMU=5FA?=
 =?US-ASCII?Q?LIGNED=28=29_instead_of_=23pragma?=
User-Agent: K-9 Mail for Android
In-Reply-To: <76ae46e6-c226-49d0-890e-c8fd64172569@perard>
References: <20231114143816.71079-1-philmd@linaro.org> <20231114143816.71079-10-philmd@linaro.org> <76ae46e6-c226-49d0-890e-c8fd64172569@perard>
Message-ID: <F096E89B-FB3B-4E06-B5A4-C28A285C07D6@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: uYIqjJy2xDb+

On 27 March 2024 13:31:52 GMT, Anthony PERARD <anthony=2Eperard@cloud=2Ecom=
> wrote:
>On Tue, Nov 14, 2023 at 03:38:05PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
>> Except imported source files, QEMU code base uses
>> the QEMU_ALIGNED() macro to align its structures=2E
>
>This patch only convert the alignment, but discard pack=2E We need both o=
r
>the struct is changed=2E

Which means we need some build-time asserts on struct size and field offse=
ts=2E That should never have passed a build test=2E
