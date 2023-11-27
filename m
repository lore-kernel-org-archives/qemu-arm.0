Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp741047ejt;
        Sun, 26 Nov 2023 19:55:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0J+Pd1UeF/NPfzOpk0x/cbG/v+CWZCjfh08qhcU12seScKgXYbjtbAn0LDmMcpu2xKxnx
X-Received: by 2002:a17:902:cec1:b0:1cf:6d8c:c8f1 with SMTP id d1-20020a170902cec100b001cf6d8cc8f1mr11392721plg.46.1701057300069;
        Sun, 26 Nov 2023 19:55:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701057300; cv=none;
        d=google.com; s=arc-20160816;
        b=eWfjoVNCzRBkhK5oHB8AtKIhylMdHNiN5mH/eQJAodde37iVt4SEPVHdcDqW5EvYw6
         /l4qKZh5rVYHZsP4JoeOPk4JSXXJ4Jse7bQOwNwLUiyxgpGGRfysT6AgqQArlSjm3pno
         CzaLen+6Sv1cQneJD4Bddt+wtrUw8VIBg06MVPOkRXnZy9PzBmUUxDhJea2SUimt7EGQ
         XW6dku1hjDyRRxqsrUAEeHGVNHydWqHzbx5Ks+1Ogm3A2hckV8iMIXyLuYVPFzuoOvXg
         zhpWi4PGoTjcSu7+YjA3J+bgA/7aLjWfOlsLH4gmP4Zm9ImyxtKeARpvAktdaLS3KGJR
         nP5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=n/B2oeugV7rvsBl26QiNw/HUulmxvWDTO/1LAtO/5B4=;
        fh=YIs6fi4xux502Hus2tOT+Pch2Mum+BNamOXX0MbPDX4=;
        b=UKVzZ9REjXASql7EttrpUjo6e2RmBcZ3fv4MDoxi7/7SyAD3gmwRl3W88hm+zhVfMa
         ksSRv7omUrL3eISgXo1XtCZYJhr6DxruUR+9/MhxnEKpDBCTaC1SS+3MJ7aM3DsrDHD3
         ompaj15ESl3O1qRt38hracdwbR3gtAawjldoyLg5nR457ELqspsn47NrDD3DZMde26ZN
         P04yAyEJEwE0XSLv66FQZiDN1vEDuisWzXF9uixof/44ximlRkhw1czpnBqzdog18rw8
         dpHBlGD+7tYocjr7ilv8ooua8gYCLFUATtIV06M+lBXwVuS34W8SC64+yWHHLn/zeaPT
         Y5xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=golyUZX0;
       spf=pass (google.com: domain of kvm+bounces-2466-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-2466-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-2466-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id q22-20020a170902789600b001cc3388573bsi8308711pll.312.2023.11.26.19.54.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 19:55:00 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-2466-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=golyUZX0;
       spf=pass (google.com: domain of kvm+bounces-2466-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-2466-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CC3D280D61
	for <alex.bennee@linaro.org>; Mon, 27 Nov 2023 03:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFE246A0;
	Mon, 27 Nov 2023 03:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="golyUZX0"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89122127
	for <kvm@vger.kernel.org>; Sun, 26 Nov 2023 19:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701057291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n/B2oeugV7rvsBl26QiNw/HUulmxvWDTO/1LAtO/5B4=;
	b=golyUZX0CJfbeXruztWXdFKEbm5lEixzqWikXfJm0iWs2Axm1HUnXSNSgZkmr9dDPd8NMg
	yebg1tq1JHo8lgFEz00m4B0BO1y6oeawCfgn3LeLiUwjWyeWWlDRAHODAxtGul+FCkyubE
	eGbpOhsY4WCzmjkKIT5Cx1qoaxqTPrI=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-7fYcutbZOYS0NwsrUZa_pQ-1; Sun, 26 Nov 2023 22:54:49 -0500
X-MC-Unique: 7fYcutbZOYS0NwsrUZa_pQ-1
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1cf9db1ac0cso33446135ad.1
        for <kvm@vger.kernel.org>; Sun, 26 Nov 2023 19:54:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701057288; x=1701662088;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n/B2oeugV7rvsBl26QiNw/HUulmxvWDTO/1LAtO/5B4=;
        b=WCeTa6ylXM2so2q1ir2zX7Lx2M8HvPzoCy8vDJKrN24Ks3e+4D/MPpBKIZB7lcF8vY
         2a4bWWr9vnwAtItwJEXwczrg8ctKUopmuOsAj1CvnHFR7DJsT4SYUzmfSgIfVsRyc1HD
         pUSVU1BOit5JFFfEQXGDyRrwb6bwQe2Rodm/wugGfhAZcUjzY00PEvaaUlMoZJKn4wIx
         TV9PLmuak47sgVQsp1y3zcPGsiYWjv8TfW0+jvgQ7tFDJmQiTFEe4nIjRs8GzPn0SBLx
         lla2UpPvLYebU3xa+YbuYWrqTohxQQM+oeLoXn7xJ1+oFXBQXcThnCllpimvqJJkA1+G
         B/8g==
X-Gm-Message-State: AOJu0YzGhZQPXQP+AgN5dFIXmHAo1RFWUFIMfnn01Z+1hS+KaMdTAX3d
	u5OgFvqTX5WUJoTKoutsi84FfUNpxDR3kFf+ctWQFUGvmhwl+AbC1KPYt6JlBGk8NagfAKXirpR
	bPLWpyRt9UeBQ
X-Received: by 2002:a17:902:6946:b0:1cc:4fbe:9278 with SMTP id k6-20020a170902694600b001cc4fbe9278mr8703248plt.50.1701057288539;
        Sun, 26 Nov 2023 19:54:48 -0800 (PST)
X-Received: by 2002:a17:902:6946:b0:1cc:4fbe:9278 with SMTP id k6-20020a170902694600b001cc4fbe9278mr8703235plt.50.1701057288243;
        Sun, 26 Nov 2023 19:54:48 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
        by smtp.gmail.com with ESMTPSA id r4-20020a170902be0400b001bb99e188fcsm7129948pls.194.2023.11.26.19.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Nov 2023 19:54:47 -0800 (PST)
Message-ID: <f8e7ff04-dfb5-4bdb-8bce-ce34b9539c7d@redhat.com>
Date: Mon, 27 Nov 2023 14:54:42 +1100
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 01/16] hw/intc/arm_gicv3: Include missing
 'qemu/error-report.h' header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20231123183518.64569-1-philmd@linaro.org>
 <20231123183518.64569-2-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231123183518.64569-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: +HMpoA0VsONZ

On 11/24/23 05:35, Philippe Mathieu-Daudé wrote:
> kvm_arm_its_reset_hold() calls warn_report(), itself declared
> in "qemu/error-report.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/intc/arm_gicv3_its_kvm.c | 1 +
>   1 file changed, 1 insertion(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

