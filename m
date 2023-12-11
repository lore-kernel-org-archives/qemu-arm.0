Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp244769ejo;
        Mon, 11 Dec 2023 06:36:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7hsyqXDb9KuLZlYoLdllYW8Z70DkSNkqAf16ODUvScnn2GBMQcgoKIvT8KTqCuVzCKzCD
X-Received: by 2002:a17:906:cc53:b0:a17:d879:7f06 with SMTP id mm19-20020a170906cc5300b00a17d8797f06mr5751637ejb.4.1702305414943;
        Mon, 11 Dec 2023 06:36:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702305414; cv=none;
        d=google.com; s=arc-20160816;
        b=w2QlyKDGuj5jC6SPuBr8hRO1owSK8NEHDL4uAUE2m3FnzGD1W6yicmpF4Fw0n7YqDs
         bKlqh5VgWSDH0jEfH00NzheS5s8i7RVz7Synr79KMGkMxEjKC+mGtRzyvFTaPhDQvoiY
         7mM3bqQs4GHh5nofL3G70ADPL9diLRg7P5rL1huYX1lEGMnQQJ4vX9apb+sOZuRRh425
         GKwdzHwMHkJJhqyl4emZMqx0qb3l2XiI1y9cLVV/lQsecXAKuXpxejo9/mZzZ20i91T4
         GcNHlj0aCbcG5a8LYwzQ/anDAwohRTGSjBQoHXjdK5fZ9j09ODG9MJQAwMe3f5FtP2oW
         Ef5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:list-unsubscribe:list-subscribe
         :list-id:precedence:dkim-signature;
        bh=hnlDRuUqfo4QrqddI/qWEwk9SWh3sjr/XXfcP2vUeRg=;
        fh=eoQB7mYEuRt05nElmkj3IN/dFmrbGZnIdf4aRaj90HM=;
        b=o/GzkqJtlE1mSpuQRMGQlaKPVMuTcTjEiG1U+pJhV/J7pg3wW6dbnyeDDuOVhNJ/sK
         AhXV0YHdG2dANNOrcs75z2OCXdoo35bY/RFFFBl7AP+qj3jeuFHpRfkd8G3cnIEhw4zu
         PCTCsGoUtLx67U8x2UPc22wOWWJ77tCiznw+IcenbeuTwYcrcT1Pee/+l+JFcXtCiHZF
         CNgNxqZFFM6VEGHuQf90O+2t5qc0m7bsKcxtO3ckafE1gGO/hGggMOZZAGAgQmbc97b+
         tqFcYOMvhgN/DSlX4WsE2HRkfdd9m2SbrM58Q+S7T5+8tTcnm302eYGIKAvByj55gvoj
         YnFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wNDq9+Wr;
       spf=pass (google.com: domain of kvm+bounces-4051-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-4051-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-4051-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id lz20-20020a170906fb1400b00a1d42df69c8si3516907ejb.760.2023.12.11.06.36.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 06:36:54 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-4051-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wNDq9+Wr;
       spf=pass (google.com: domain of kvm+bounces-4051-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-4051-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CF5C1F2144B
	for <alex.bennee@linaro.org>; Mon, 11 Dec 2023 14:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC75148CF6;
	Mon, 11 Dec 2023 14:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wNDq9+Wr"
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 850A59F
	for <kvm@vger.kernel.org>; Mon, 11 Dec 2023 06:36:45 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-54f4b31494fso6414899a12.1
        for <kvm@vger.kernel.org>; Mon, 11 Dec 2023 06:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702305404; x=1702910204; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnlDRuUqfo4QrqddI/qWEwk9SWh3sjr/XXfcP2vUeRg=;
        b=wNDq9+Wr1V/HEJknxRt5wJ39c6fqZQJoapUFfPupvT/mBI5VPM9lQbMQ5PghILgRGm
         3i7HefGl7RhoQaIMDcP/kbMTFtQy10WM09EHg86s89q2oQpgPMOsBSNEpCl9mzrxsdZU
         971L7IGAu+hrbLr056jftKzDW/yadD/PgA6SIpMQ1vYV2whrePMzYHdTMacWAmiDDBoP
         NYdoK+pPYT/lKbaU2Mnh4k5ekUoT8QieZ5s/k4NumzSpdKAYAj+81LEPlw+kc9GWsz8w
         tKQ2H6vDJq5Fu9YWVj/CMdw2igQZVzbwv6cLL3sYUqC8c+Jzr/b+JFvXFjyQOCCR2ZY4
         JRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702305404; x=1702910204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hnlDRuUqfo4QrqddI/qWEwk9SWh3sjr/XXfcP2vUeRg=;
        b=mfYgVeDJ/Oe6266+NnDsv+DJGGj8byLyCeGG6DXIjAf0OxsDLz60LKWt/MNoFymljs
         A9UYRD2xkwldYzYJRoe4lMq8K46fwvD7SfSiZnQD12PkejvIOQzR9shZztVCKJnt/dLO
         oR62/6fXVFrHLR58+o/7fbZGi4AlTZQywogLvtgvy/p63UYaL3DgdyD0da9GdrJbcEe9
         Akd9BYEnAXMaMlUChOf0OZelZrqzUDlJDTPmITnrVeuvbmIKw8uF7kZSULhogKAJcw4Y
         Y2Gi0HHcsnOIarL0rXwpYIHD0RoXoC4ibXu266JfAK6HYtsfUu5D0KtMmfbMo3s1rGyC
         Ogww==
X-Gm-Message-State: AOJu0YxgPIkGLIt+j9HK1SExeb/nxVt3eJKjA9Lxo4otieQQu+g+LXkT
	g7utG9//ofojqmz0XNbG5jU2J3WjF2vI87SzcsEiVQ==
X-Received: by 2002:a50:ef17:0:b0:54b:38f:7263 with SMTP id
 m23-20020a50ef17000000b0054b038f7263mr5484022eds.8.1702305403990; Mon, 11 Dec
 2023 06:36:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231123183518.64569-1-philmd@linaro.org>
In-Reply-To: <20231123183518.64569-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Dec 2023 14:36:33 +0000
Message-ID: <CAFEAcA8S7Ug8uFpvDO9FarLpLhTr_236H8gOK=dEOWQZe-3zgg@mail.gmail.com>
Subject: Re: [PATCH-for-9.0 00/16] target/arm/kvm: Unify kvm_arm_FOO() API
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 3FuvNvXqt4t4

On Thu, 23 Nov 2023 at 18:35, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Half of the API takes CPUState, the other ARMCPU...
>
> $ git grep -F 'CPUState *' target/arm/kvm_arm.h | wc -l
>       16
> $ git grep -F 'ARMCPU *' target/arm/kvm_arm.h | wc -l
>       14
>
> Since this is ARM specific, have it always take ARMCPU, and
> call the generic KVM API casting with the CPU() macro.



Applied to target-arm.next for 9.0, thanks.

-- PMM
