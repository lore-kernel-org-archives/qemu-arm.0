Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp404582njc;
        Fri, 21 Mar 2025 08:38:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUx8oHD12LaQRaAXt/0av28k/NN9y5X3idHBjHw7Jx2lI/vZoCq8auyRmyYgI8AZboNXsrpF/QHCbrAzg==@linaro.org
X-Google-Smtp-Source: AGHT+IG9W6bkcMj7zqbOlBNjjdEmk1uuSF4ENr16cKFmjoCJ2P8wQ80HWvKl6wDlarH8pM96k0zI
X-Received: by 2002:a05:690c:6501:b0:700:a655:47fd with SMTP id 00721157ae682-700bac7c5e2mr53515717b3.19.1742571481477;
        Fri, 21 Mar 2025 08:38:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742571481; cv=none;
        d=google.com; s=arc-20240605;
        b=a96oXZb1cgdQs6ULuT3uk+KiRfP52tW8tnxNBbMPHgR7yNwdRwnH6Ln2Aoz0NpelWa
         QD3FZMwlv2kv9kcom3vydic3pVAx2FSyareDnLhDZUwOPmqVfpCzJnHOzUeaeF6GLbhU
         hvzeCa9Zvxbe4O8k2GapCaCtLMZQu/2UqavYah4zEFRsxQLjw0dKzDWEGsWhGWtYyJ5A
         wilUHgBbGCk39ohcTJs+x9YTBfVR9AVM7y4qSJMWj8rDfkEllChxIfB5R3V6DBO7lTIG
         EkNyrBob2oW2rf2XASnrxUv3TPgvoSG2Y4dgrtkDHTwinmEPH5FUgcnKHRw/Bl2MIO70
         yYNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=Zsp9JI04JXi+Vmc7vqu6dQ+XML21a3NSKO6A2qWfieA=;
        fh=d6wxPPJRpxgiDQId53zhBFRdLEAFSnCdOHTHF9j9fm4=;
        b=TJ3s9N4C30a/2GduIy4/xqSTNDqMyi8ye33FYTuiY9z8X/KyCm3SZyvT1njG8GE6Pf
         Xgmxsq8T5oWKiy+0rZSHBTnn/JtSB0PLeo4kTnPoPfDNLvf8DyhSho2lxC4l1QrFMxIL
         YMr1XY1xmHmdHNXuocpjtzxr2BvbIeJ+VluMFtLxNKfLUeDrAI3RmDr0BXqLp15wu17L
         PjUwkIAlDweV0gJhNOi536N+IjPF8oEXWIzheio/zoLx8QJXsqJy7mH0k5aX7SGgUPko
         n+mhc/HWoEZBsekGrAtGf6a8b6fqfOcCTakRFVSzKyVEOMBS5hEivmKv2MYzINXPrxV9
         nMNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JEA3onQT;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 00721157ae682-700ba6e0159si17282457b3.17.2025.03.21.08.38.01
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:38:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JEA3onQT;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742571481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zsp9JI04JXi+Vmc7vqu6dQ+XML21a3NSKO6A2qWfieA=;
	b=JEA3onQTk02eG/o7a5t/2YfIW02YiADfpbi6hqHKefUr1pyO0ZLooYJIQo2RTBUCyWrWRK
	uqgs93rbswSYweuNhyqo1qX2DO38cUMaztE33aEiWlY1teXAUe8nSM5E9GPdlFWkCiMEnG
	pIZRNzOt9inRsRGKBLSRbupIvlt+nhI=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-654-b8z2Ij3BOEuwi5Dn4fMFmg-1; Fri,
 21 Mar 2025 11:37:54 -0400
X-MC-Unique: b8z2Ij3BOEuwi5Dn4fMFmg-1
X-Mimecast-MFC-AGG-ID: b8z2Ij3BOEuwi5Dn4fMFmg_1742571472
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1827018C46E4;
	Fri, 21 Mar 2025 15:37:42 +0000 (UTC)
Received: from localhost (unknown [10.67.24.51])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0717318B35EA;
	Fri, 21 Mar 2025 15:37:34 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, shameerali.kolothum.thodi@huawei.com,
 armbru@redhat.com, berrange@redhat.com, abologna@redhat.com,
 jdenemar@redhat.com, agraf@csgraf.de
Cc: shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
Subject: Re: [PATCH v3 02/14] arm/kvm: add accessors for storing host
 features into idregs
In-Reply-To: <37fd4871-f3c5-43bc-9dd5-1c0f72dcd392@linaro.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250311162824.199721-1-cohuck@redhat.com>
 <20250311162824.199721-3-cohuck@redhat.com>
 <37fd4871-f3c5-43bc-9dd5-1c0f72dcd392@linaro.org>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Fri, 21 Mar 2025 16:37:28 +0100
Message-ID: <87sen6tmx3.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: Je4foekwEHEM

On Tue, Mar 11 2025, Richard Henderson <richard.henderson@linaro.org> wrote:

> On 3/11/25 09:28, Cornelia Huck wrote:
>> +/* read a sysreg value and store it in the idregs */
>> +static int get_host_cpu_reg(int fd, ARMHostCPUFeatures *ahcf, ARMIDRegisterIdx index)
>
> This still isn't used, and so must Werror.

Hm, I guess I could merge this into the first patch actually using this.
