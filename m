Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp64924njk;
        Thu, 23 Jan 2025 02:53:09 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUE0iz5HpXPzv7pM+1sL2dbxL6SKNUNzpZvlqxn7LoKbdUBMhcBzDRUpxTNDW5/k6J04SSjoF5wF7liqg==@linaro.org
X-Google-Smtp-Source: AGHT+IE/mtrLMTlmOYp6GMJbkDaEpGK2LEUNG/p4GTo/YFXA+RJ0lcWm1/X01N2eX/K6tye+6th6
X-Received: by 2002:a05:622a:15c9:b0:46c:769c:53ab with SMTP id d75a77b69052e-46e12bdd9e3mr367633731cf.47.1737629589558;
        Thu, 23 Jan 2025 02:53:09 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1737629589; cv=pass;
        d=google.com; s=arc-20240605;
        b=R2OtWBjL+AnhWPCwsYIim0WbpiWxSDHqT8iLna5X/z/hbsUla6fIfBSmEO08H8GhUO
         qNo8yBB99lUGqWXda84TdMVD+i3itLH7xOBXHZPRR2fB9bBi633VWdP6lnt0Y5eCuqFW
         o2iTO5Bfxp3czfPd40jNSK5EixjJY8BJKzFfoeGI4NMYeAak6VP3yMvmmgd6tTLPPVCJ
         LlTkcV+IYN81rsZuGY+u+5dM1Z5IlwtaSThX+o1NYpibtqsJpSH5uXwvHfUYtH88HkCg
         PKNhw7dapvlpCEa+sJxTUufCj8T/wXwgyf0ZAFy2gS3kvfRGcizb/Dmt/xqVNj/MGIKo
         MaFA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date;
        bh=aNbu+LfTb/oUtz29A3h3VoF1EgiIWVJhl6QDn+5Wrjc=;
        fh=DjfmP4GuGmv+HIZ6mSuNbs+OASAdIuzO7/WHsW02d/E=;
        b=hPLAjEc2GaqUwXXo0HaFzX7A+Xib9XG6hgwL/Hm60tfSu6SmO3FoGt7LywumqyB+VG
         vXcWbJ2AM59rSlOLQD2ea+yjxI2xvSUGBtZDBsVNR28+YG1cvzVfkjmQdrACnbUL7cp2
         4K5NfWRnrkya5E/EJGtmeVmJNBCEY3/7kWJegrE1Z6+Zlw9ZlmNkD6b1k6bPtChxt7Wb
         VVsZb9g8elRTqYmjKo8PW1fc/5xFKBdw4eNd+yf+CoYzGQAI/k2B3JwZImOL2i25zEaI
         7qu7CvOGMoNZmzXDPqMdpAZkxe9enrSo/+ME6aWYOJnZFyD5CBew3l9ckJWln43+D9vN
         JLLg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-486549-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-486549-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-486549-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id d75a77b69052e-46e104589c5si188536291cf.404.2025.01.23.02.53.09
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 02:53:09 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-486549-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-486549-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-486549-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34C3016D633
	for <alex.bennee@linaro.org>; Thu, 23 Jan 2025 10:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1397D20DD68;
	Thu, 23 Jan 2025 10:52:57 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F35F20CCD2
	for <linux-kernel@vger.kernel.org>; Thu, 23 Jan 2025 10:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737629576; cv=none; b=JcRqK+2ksVOXFJGw3FAVwEMRh9LNGP1LEtkd6fS4CXMdX9K3TEpWq4f5Uv+JncY/wvowFgkNo5ugrwTG1YptZWAi8NJIp7ydzi2fqoctY8kO/VvtwBaBjH0QY1pc6ddwHF8DoNnGkxOhYiPG2D4oG80LpojOyNlbT4gTo2GIhJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737629576; c=relaxed/simple;
	bh=gmORltQufNgL8yh1Fu5Lg2EQzxxiBc/EvUGA1HcZK5M=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TzTRuwS7/5xycVDuLxvWmHQ0uAucu5JXLGk2uG7r+2gqhmXGRwlhGFYyJHVLrjRncqn8TNBW0g02rXKIENdA9BIh671Ej07rNxowcuTwxE6WogffqhUv6uVxsW7fCcegQRWFwtEHas6NPfF2+ToKHu77WpoAsMSNkhXeLX0Joag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YdyR41wT2z6M4Sh;
	Thu, 23 Jan 2025 18:50:56 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 3F6BF1404C4;
	Thu, 23 Jan 2025 18:52:53 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 23 Jan
 2025 11:52:52 +0100
Date: Thu, 23 Jan 2025 10:52:51 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
	<mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
	<gengdongjiu1@gmail.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 06/11] acpi/ghes: add a notifier to notify when error
 data is ready
Message-ID: <20250123105251.0000057f@huawei.com>
In-Reply-To: <b359780154cdd4b4813ee0f6c3ae5a0bb622eb8a.1737560101.git.mchehab+huawei@kernel.org>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
	<b359780154cdd4b4813ee0f6c3ae5a0bb622eb8a.1737560101.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: YUEJyzGn0WKh

On Wed, 22 Jan 2025 16:46:23 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Some error injection notify methods are async, like GPIO
> notify. Add a notifier to be used when the error record is
> ready to be sent to the guest OS.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
