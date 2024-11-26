Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp373189njb;
        Tue, 26 Nov 2024 13:27:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkyxkw50pqHbMWSrjQUkan+pmcCv5Xxv1xzY7dPw3+4zlbIzHF5YtYVrbUuhQKYbspNoBQ
X-Received: by 2002:a05:6358:5bc5:b0:1be:de52:97b9 with SMTP id e5c5f4694b2df-1cab15a5ecdmr141954855d.2.1732656435642;
        Tue, 26 Nov 2024 13:27:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732656435; cv=none;
        d=google.com; s=arc-20240605;
        b=Uf60ILRa7rc54zonTkEiSYCNT8w+V3v/aykjFgtDjH0ew6TrhiuJyqXUNu+nLYzSAf
         u4jGxBZVVG1YOfP2u3DnVvZL0TfEYZrSuEDF0i2hm2SIBllYc347lnX+VJoTl9KxRko/
         M0yZnnotuS+fbZCc0jahtPbfrs5NL8YN22bBRfKmlv0rF8lNTvBFokTSbGPZaCXm4rbc
         fyLW3UNN6Xd/4FPKIka2bJ48lrQJVSDhoAPxqg0mRlfAN71XC+yDBLvLiBSdReOa1PCB
         vPEBa4tE2VeRaME1b1TQXieCkz02tJ1x94wEptRWH4orxZoqXLjcWzM9s5jnYpdpwIxj
         6a/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=2bVfuVSIsMKCKvriHIIacA8lNNZ42nxSlyRz3CpsIdY=;
        fh=2/VQF0v7jmkhNtE945WOt7ugov0tjBIOogjJ39ElaQs=;
        b=Zu3G3hSjro0pI+lN2zlJeRuAMv/twnbMWg0YE1dT8zgNEAnfNZ2oIW3+7+AEeQqnrt
         9GXubr6hRAwoevOT2Mw/mGbJ39dwLAhuatBqTwonCjQxX68iJ4dJnZSXTSTyQteXhUFM
         nFFZg/+alMHwRwtpUHZvJNWPkbhFjrUq2p+d8k/XTc23fcc72KUAOblVOICK3/YaBSRW
         dbfo7oFYjrvXQFw1KJeqljiiTQ4V3XMInLHVPRQhDp6sKJaRIq8WWCpWlHNOxSaSkKYX
         AeoqWsoPYHVb2xGoVxksfvFy8tt4lrBHCpGMJc98ePBvLKQ53FAuGYMA6lPyG8KM7rZb
         q1Jw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LkKuaLb+;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-466a7d9698csi23481291cf.619.2024.11.26.13.27.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 13:27:15 -0800 (PST)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LkKuaLb+;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732656435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bVfuVSIsMKCKvriHIIacA8lNNZ42nxSlyRz3CpsIdY=;
	b=LkKuaLb+SmCQwLYB/uG74RmTElYfNa1HZVhZ1A3q8zGDPPZN4YM+8+EpHOdJEccPDpDheo
	2TB+P3RgJZEmVwYP/p+u+UIKEpAF1OUPb70tshIoW+/xapDMzIni5wRZTAax5Q4EA7As1C
	8VmXmDPDMAZHjQs8tZpgudlJR/OHcgU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-_Ao6g2UkMeqW--G2zI4MAg-1; Tue, 26 Nov 2024 16:27:14 -0500
X-MC-Unique: _Ao6g2UkMeqW--G2zI4MAg-1
X-Mimecast-MFC-AGG-ID: _Ao6g2UkMeqW--G2zI4MAg
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4349df2d87dso27927325e9.2
        for <alex.bennee@linaro.org>; Tue, 26 Nov 2024 13:27:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732656432; x=1733261232;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2bVfuVSIsMKCKvriHIIacA8lNNZ42nxSlyRz3CpsIdY=;
        b=QeC8THGBpECUWCzfzc6gGw2GImOuKIKP/GbUSZLdIiLdhPNeO08k2ilLGbdLojyn8o
         nd1q7pqapA1jhS/WY1a9llsxgy0OYLdpXSBh7gM94LebOrbQdwZGIO2AY8W6XWw3xrHS
         r9jkWNQoxhjJ4cRtyMUMnn81eMPfHTngTv/3EHtFKgViuDs0AO9P/dcKF+mTRpP742h2
         cCTQ/9kUI9jUU5b24r1dLbWwkfhDaKeoOcc6FzAseguVbxd7LHJb7o3amV+0RtGb1yDJ
         UcP7gx9M8oRzAXtAtf0fLA/MF/KtUpTkMyKHTSU0Dk8FrGHuxmdErc+0zcgm51cujH38
         zuNA==
X-Gm-Message-State: AOJu0YzZ1YIazYtrlC6vMGNKrXjjREv9emVkikRZxxVIM1VgBPphVXzp
	LDngOG/0U8J/bdokXCKQkymo8Kw/bK3EKNdw1W1Sasj20cLsppHOYEp7zM2HeCgPBAisVGK+LyH
	tzCJKuYsJw8jN5Ri+Cwl8Z1ryyZO5HDQDszSx4Kqdc3vSyuZlmiDDjXFhjJXV3mCY6/TS16K7Cr
	UAwCZP/LHDLQE+rMkTaUWlvlX0eopOmeY=
X-Gm-Gg: ASbGncu9iSVf5jU+OARyBaYtwVo14JEraFsHl/Dl2TR0W03YQhidybuM9Wff99i8hYh
	4pFZXKR7vWkQDyLxIgy39M6rRH0BusWqjCTYwkeWNC02tYZUPoFVc62VkpJBok7uNx3uGb1teXx
	9ncGYO1fAzRI9Hj5IRRVBF5uSBrvvpn04LNtcrZflqIN8dOLxZLO0w6EiNZQ+zX1Wp+OqJd3Qfj
	wjNMDTH4Sd9OyGqqplmQC83AG+oLd8l5tbtqI8U5A==
X-Received: by 2002:a05:600c:2244:b0:434:a8ef:442e with SMTP id 5b1f17b1804b1-434a9dfbafamr7729305e9.31.1732656432564;
        Tue, 26 Nov 2024 13:27:12 -0800 (PST)
X-Received: by 2002:a05:600c:2244:b0:434:a8ef:442e with SMTP id 5b1f17b1804b1-434a9dfbafamr7728705e9.31.1732656432034;
        Tue, 26 Nov 2024 13:27:12 -0800 (PST)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2a02:14f:1f0:4654:4e59:b33:d0e:9273])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349ea54e13sm95116915e9.34.2024.11.26.13.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 13:27:10 -0800 (PST)
Date: Tue, 26 Nov 2024 16:27:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
	Thomas Huth <huth@tuxfamily.org>,
	Bernhard Beschow <shentey@gmail.com>,
	Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
	Bin Meng <bmeng.cn@gmail.com>, qemu-s390x@nongnu.org,
	Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
	John Snow <jsnow@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Markus Armbruster <armbru@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Ani Sinha <anisinha@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 39/39] docs: explicitly permit a "commonly known
 identity" with SoB
Message-ID: <20241126162651-mutt-send-email-mst@kernel.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
 <20241121165806.476008-40-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20241121165806.476008-40-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ARH7lvOYyhDg48CeR8lpg8iLuvqAKy-SPuSFjKU5xoY_1732656433
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: P5L3y2/I9RIp

On Thu, Nov 21, 2024 at 04:58:06PM +0000, Alex Bennée wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> The docs for submitting a patch describe using your "Real Name" with
> the Signed-off-by line. Although somewhat ambiguous, this has often
> been interpreted to mean someone's legal name.
> 
> In recent times, there's been a general push back[1] against the notion
> that use of Signed-off-by in a project automatically requires / implies
> the use of legal ("real") names and greater awareness of the downsides.
> 
> Full discussion of the problems of such policies is beyond the scope of
> this commit message, but at a high level they are liable to marginalize,
> disadvantage, and potentially result in harm, to contributors.
> 
> TL;DR: there are compelling reasons for a person to choose distinct
> identities in different contexts & a decision to override that choice
> should not be taken lightly.
> 
> A number of key projects have responded to the issues raised by making
> it clear that a contributor is free to determine the identity used in
> SoB lines:
> 
>  * Linux has clarified[2] that they merely expect use of the
>    contributor's "known identity", removing the previous explicit
>    rejection of pseudonyms.
> 
>  * CNCF has clarified[3] that the real name is simply the identity
>    the contributor chooses to use in the context of the community
>    and does not have to be a legal name, nor birth name, nor appear
>    on any government ID.
> 
> Since we have no intention of ever routinely checking any form of ID
> documents for contributors[4], realistically we have no way of knowing
> anything about the name they are using, except through chance, or
> through the contributor volunteering the information. IOW, we almost
> certainly already have people using pseudonyms for contributions.
> 
> This proposes to accept that reality and eliminate unnecessary friction,
> by following Linux & the CNCF in merely asking that a contributors'
> commonly known identity, of their choosing, be used with the SoB line.
> 
> [1] Raised in many contexts at many times, but a decent overall summary
>     can be read at https://drewdevault.com/2023/10/31/On-real-names.html
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d4563201f33a022fc0353033d9dfeb1606a88330
> [3] https://github.com/cncf/foundation/blob/659fd32c86dc/dco-guidelines.md
> [4] Excluding the rare GPG key signing parties for regular maintainers
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
> Acked-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20241021190939.1482466-1-berrange@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>


Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  docs/devel/submitting-a-patch.rst | 7 ++++++-
>  .gitlab-ci.d/check-dco.py         | 5 ++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
> index 83e9092b8c..10b062eec2 100644
> --- a/docs/devel/submitting-a-patch.rst
> +++ b/docs/devel/submitting-a-patch.rst
> @@ -18,7 +18,7 @@ one-shot fix, the bare minimum we ask is that:
>  
>     * - Check
>       - Reason
> -   * - Patches contain Signed-off-by: Real Name <author@email>
> +   * - Patches contain Signed-off-by: Your Name <author@email>
>       - States you are legally able to contribute the code. See :ref:`patch_emails_must_include_a_signed_off_by_line`
>     * - Sent as patch emails to ``qemu-devel@nongnu.org``
>       - The project uses an email list based workflow. See :ref:`submitting_your_patches`
> @@ -335,6 +335,11 @@ include a "From:" line in the body of the email (different from your
>  envelope From:) that will give credit to the correct author; but again,
>  that author's Signed-off-by: line is mandatory, with the same spelling.
>  
> +The name used with "Signed-off-by" does not need to be your legal name,
> +nor birth name, nor appear on any government ID. It is the identity you
> +choose to be known by in the community, but should not be anonymous,
> +nor misrepresent whom you are.
> +
>  There are various tooling options for automatically adding these tags
>  include using ``git commit -s`` or ``git format-patch -s``. For more
>  information see `SubmittingPatches 1.12
> diff --git a/.gitlab-ci.d/check-dco.py b/.gitlab-ci.d/check-dco.py
> index d221b16bd5..70dec7d6ee 100755
> --- a/.gitlab-ci.d/check-dco.py
> +++ b/.gitlab-ci.d/check-dco.py
> @@ -78,7 +78,10 @@
>  
>  To indicate acceptance of the DCO every commit must have a tag
>  
> -  Signed-off-by: REAL NAME <EMAIL>
> +  Signed-off-by: YOUR NAME <EMAIL>
> +
> +where "YOUR NAME" is your commonly known identity in the context
> +of the community.
>  
>  This can be achieved by passing the "-s" flag to the "git commit" command.
>  
> -- 
> 2.39.5
