Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1278942njb;
        Wed, 14 May 2025 08:37:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUyLajaFBMfU2Mxts2HmQWFRyzVgWSXzmBpvjh2Jcps+sinWzNi5V6eciHsmSJmOCJOHjPw3zLdpGOOCA==@linaro.org
X-Google-Smtp-Source: AGHT+IF1qaxSg1o3y/fqxoc28V+Ryc0QHThaDTzJyTwNJMZV6RPSIS3d0Whp6PJwPIBLiJRnD2Kv
X-Received: by 2002:a05:622a:17c6:b0:476:60a1:3115 with SMTP id d75a77b69052e-49495cdcccbmr70287941cf.33.1747237030739;
        Wed, 14 May 2025 08:37:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747237030; cv=none;
        d=google.com; s=arc-20240605;
        b=eKnDuyzYUy4ywMrOD06l5hAOt8tnW8EKRr3QLMxRkkUXE9PhZHKwoWEsWuH6SYCICL
         L9Nz5vF+iOgL0peJA/7n9nSgO9L7F2tn0WMMxocIg9aXWzvTJY2rPWwhC4/RluZjAjFu
         HvddrB4onzyNOIldXqxvt11IPeKwvyGWLmEUS2ID1+LcJIMQ1KruOLuN0sBlnF+5dwfH
         QtKtmmzSZANhCpqLrvHXoRXFeKTwabOn9l7E7L0I8hiKM0JAjaaAFoPP5Fh+M0jC0Ttm
         PKyBrtdG/FSWOmKxPvWtKmcPubMp/i8X7lzEJCtreZNxMCoAWrzE8GXCBmAHkcmrObxq
         SxrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=rNqpKMDVkRLgudOp61Ys+LEkD187I+q8Zkd/KYUyD+A=;
        fh=/KoMIhHVH4bgnRnJJr9qjUY3evIdB8XTi4Rz87cJiSA=;
        b=f1kwsuo7APCPNMA3+67cma/7XKZ9o35TWQpAp2F8If+KtP1M9q2MZrv2qb1OIDayUr
         aFVAiIzCiYHlupWVpVJ/GFFcxCPR+9vWx6mcRoB2GJWlwK+UmbcQmS/+gu/+pTlj7zw3
         c/L6jZPM0tvSS89hKkl9ViyyaliaYgZf2PIJv3gB7HqMIrPXhso8nTm/hn9bOKIplqY8
         HboSSEm4qcdbdQz9QS8Bu0rkoyFInE4iVjZwSeahMB2LjaI/O1es6cTWSuNx9Ys8IIZ7
         iASqycXWm7Ovc90KdxNKYYJ+g52t44m4WOHonA/w/JpXAZCtv+toWGHMtjPqJ1mNYy2X
         6F6w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y59z4dos;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-49452458bf3si136341451cf.20.2025.05.14.08.37.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:37:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y59z4dos;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747237030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rNqpKMDVkRLgudOp61Ys+LEkD187I+q8Zkd/KYUyD+A=;
	b=Y59z4dosBrHGE9Ou9nUu0aL+mKtSjaL0s1STcSrIWSN1SMluudC6C1RywP/0GvE8m+J/uM
	HNOfBVBUOFJcjgOQu2b9VmHPGBOz/GmL1dSUysDJrzDPsFGRZwbJj0tIs+pHo6FUloRMaY
	Y9fhWwTxXdd37vYhAay/QDPQl0OgnWI=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-639-8-jyKCLfMyKwIM9GNFW6lg-1; Wed,
 14 May 2025 11:37:07 -0400
X-MC-Unique: 8-jyKCLfMyKwIM9GNFW6lg-1
X-Mimecast-MFC-AGG-ID: 8-jyKCLfMyKwIM9GNFW6lg_1747237025
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 745621955DB1;
	Wed, 14 May 2025 15:37:02 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DDB421955BC0;
	Wed, 14 May 2025 15:37:00 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 abologna@redhat.com, jdenemar@redhat.com, agraf@csgraf.de,
 shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
Subject: Re: [PATCH v3 08/10] arm/cpu: more customization for the kvm host
 cpu model
In-Reply-To: <aCNsSbDoi5oKWYul@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250414163849.321857-1-cohuck@redhat.com>
 <20250414163849.321857-9-cohuck@redhat.com> <aCNsSbDoi5oKWYul@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Wed, 14 May 2025 17:36:58 +0200
Message-ID: <875xi3cig5.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: WaS92s+ElNw3

On Tue, May 13 2025, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Mon, Apr 14, 2025 at 06:38:47PM +0200, Cornelia Huck wrote:
>> From: Eric Auger <eric.auger@redhat.com>
>>=20
>> If the interface for writable ID registers is available, expose uint64
>> SYSREG properties for writable ID reg fields exposed by the host
>> kernel. Properties are named  SYSREG_<REG>_<FIELD> with REG and FIELD
>> being those used  in linux arch/arm64/tools/sysreg. This done by
>> matching the writable fields retrieved from the host kernel against the
>> generated description of sysregs.
>>=20
>> An example of invocation is:
>> -cpu host,SYSREG_ID_AA64ISAR0_EL1_DP=3D0x0
>> which sets DP field of ID_AA64ISAR0_EL1 to 0.
>
> For the value you are illustrating 0x0 - is this implying that
> all the flags take an arbitrary integer hex value ?
>
> This would be different from x86, where CPU feature flags are
> a boolean on/off state.

Most of the fields are 4 bits, the allowed values vary (there are also
some fields that are single bits, or wider.) The FEAT_xxx values (which
can be expressed via ID register fields, or a combination thereof) are
mostly boolean, but there are also some of them that can take values.

We could cook up pseudo-features that are always on/off, but I don't
like that approach: they would be QEMU only, whereas the ID register
fields and FEAT_xxx features are all defined in the Arm documentation.

An additional difference from x86 would be that FEAT_xxx featues are not
neccessarily configurable (only if the host kernel supports changing the
ID register field(s) backing the feature.)
