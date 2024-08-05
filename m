Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp923259njb;
        Mon, 5 Aug 2024 10:01:15 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCW/pnmIDhgqKk4WgY0D93VWGyPTaSYRn/tlJRaNwh819Hdrqh3dwrka5yiwGRpPWKvRLMyI+ViIQbqRmSwI469OzWkOdKWQ
X-Google-Smtp-Source: AGHT+IHTy/EpXLrTaGfPo0Ad61rI0Tc997s6iwPTo++n5LdCEyhzKkgrGS00v5Ia6XIbX9HHGW11
X-Received: by 2002:a05:6a20:7346:b0:1c4:986a:de71 with SMTP id adf61e73a8af0-1c69960e1a1mr13369155637.35.1722877275434;
        Mon, 05 Aug 2024 10:01:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722877275; cv=pass;
        d=google.com; s=arc-20160816;
        b=G4v9s7V1VndNmld9opx8CvHs+aH5M47AxlcgiWxl5mS0PZKj5F5NGtsmi8ul7GvC3B
         BoqiKnTIZ6ZgEX+FWpMWyjboBC3hEk0OCXXniZ5Cbo0z8+nJJO48FGjuq7+Iazb+WQHC
         Z8MhYvUrtD2V1M6g1WNG1AYFC411P7zxbHMCitd9XwCRqaj87dzWHpwXIzLblZAG0xlj
         luNNGPc2EcBpUDC2mj5YVacmDGxda9eB5AD2G3+QCuC/esYW3c6cAsHvWrzMfEtiI6by
         Ai5ZivomBsV77F+Vou0H0zXspZ2H4V+rk8omdNg9LXq0yWgMm7R6Gt0WGnQ5sSsvw11d
         OG4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=n+GtMLC44VoM40McGhYsteB289mTKlbWLMK/3iy/0dE=;
        fh=ErPUviK2DCjVwVqdFIMqzzTdbuAYPXVUrcKSm5WVsxU=;
        b=mYlHI1XU1qXx5klMxrapD93hBQtJ6AERbFpHy5k5s3wi67y3tdnR1fwXTWdBA+Lx8Q
         z45PmeI/hot915YrIMFpJVSa1aGzjGTluTUUO/EkfjjK+DbzJHAf9vApYaTB8UA98Cpc
         TN9rPGiq3thEs+NKm9OZvCKjiXXZIBvVmp1q1RsODKmGrrmDeqDmbxVBQfou3Ii+En0e
         xGAwML/8W/qTm09p0N4MfjOmfMJxJAsOWaU0frxWJ5HxGs8Mcn4Qfye/f6PGrTn/2kGE
         u4S6tlp9c/s7DjyhjoZUkdt/LpvVTvThtK4/k0s377i2thi5D08Gab+njRapJdak9fQ+
         prTw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-275033-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-275033-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-275033-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7b766297610si7765663a12.896.2024.08.05.10.01.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 10:01:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-275033-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-275033-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-275033-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 284A2B2165A
	for <alex.bennee@linaro.org>; Mon,  5 Aug 2024 17:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7F515ECE5;
	Mon,  5 Aug 2024 17:00:59 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1DC15E5C2
	for <linux-kernel@vger.kernel.org>; Mon,  5 Aug 2024 17:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722877259; cv=none; b=nmtxg8Kxmk9iYy/PP4uAqKG/yScqrKiLMAl+THWQzt+7MB8uwVQZRjHtuepKIA+Q1SdGXkWv9+TtwRr+4v/OHiQrATNXcvTRWT2qkPXip2fb5zRU9oU8DgAXeBJpHyjVKOgL7JLni68CYSzFY80pYEO0EI3iAZPR62UG+y+zwis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722877259; c=relaxed/simple;
	bh=C0Lb2+ikMjyrzJEP0TPmYTOl2+OWkSA21UCi+5HjmCQ=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jRbss6rHeLCwASvMoWKHvcHCSypEN3RLQku6jkbn5WglC6ksUVbQaLAX48U0l98UEPVv3LxuE8hME7/gi3xemJjo9j7SmA9sdpMrG3bc1mOy2M0hagqRdE6z1yuf9L25jlBO9opWSUyyMx899g/OVO8kICd5Twl8fE7NYPFz49A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Wd2gm2qvjz6K7Ft;
	Tue,  6 Aug 2024 00:58:12 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 75BD01400F4;
	Tue,  6 Aug 2024 01:00:54 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 5 Aug
 2024 18:00:53 +0100
Date: Mon, 5 Aug 2024 18:00:53 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Shiju Jose <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Eric
 Blake <eblake@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	<linux-kernel@vger.kernel.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
Subject: Re: [PATCH v5 5/7] qapi/ghes-cper: add an interface to do generic
 CPER error injection
Message-ID: <20240805180053.00007c5c@Huawei.com>
In-Reply-To: <51cbdc8a53e58c69ee17b15c398feeeeeeb64f34.1722634602.git.mchehab+huawei@kernel.org>
References: <cover.1722634602.git.mchehab+huawei@kernel.org>
	<51cbdc8a53e58c69ee17b15c398feeeeeeb64f34.1722634602.git.mchehab+huawei@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-TUID: yET4YgNtFQ11

On Fri,  2 Aug 2024 23:44:00 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Creates a QMP command to be used for generic ACPI APEI hardware error
> injection (HEST) via GHESv2.
> 
> The actual GHES code will be added at the followup patch.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Looks good to me.
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
