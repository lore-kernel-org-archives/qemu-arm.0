Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp529844ejy;
        Tue, 21 Nov 2023 07:00:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH409LAZ8YRlXgHD7lfWEVj/AQyIsig5+iBUi8DvyRHKHCOp62ovEO/ZpOyPI2d0Yl5sI7B
X-Received: by 2002:ad4:5de4:0:b0:678:f4bf:8fda with SMTP id jn4-20020ad45de4000000b00678f4bf8fdamr11537886qvb.58.1700578819516;
        Tue, 21 Nov 2023 07:00:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700578819; cv=none;
        d=google.com; s=arc-20160816;
        b=yD5I8AQaZ/TL6ip2wIb0W5k/IOxVlJp+dV6yHy+mgl3rZbDOa97/K3OpSYgUJHSnum
         nFBWudlJNgLLxV9WgcwUJi8yZRD6Zg+yWycPkoXe6bSJ/sPP0cr1do6dAjczP07OGYgS
         mXIVHkVDgJfVJz1Tuq1S658grrmd2fjdBP61oawqoQvvms4sUbWfKwgBn6vGdL0cf/QF
         8BmjBFp5mD/xN4cgWo5X3xhjDKuh7oJE9Z/d3UcSLlZD3H8oADGc2y9In4vhVln6W767
         QubBvjYMAuzo4DOJQnh05ngzrlbQjFw5aXdXB4cllPGMnnWrXboyO49Yda0OYMCNnywG
         7pNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=9+e37xbCO7NQITrKR48ai04nJ1t0h0koWejgbUaE2q0=;
        fh=CsdiWNFHKpDi85bv+LYNHOHQERFxFhU1c1y9HbqB3eA=;
        b=ATuIGjYZVUCMFjAcS5Bdn9iZlBsb2KLRAJH8nuYdiqkoLsP8P/WtYJy9yAp7nxIFht
         CykLiMn8X3Eq7VPEc55Pfhgbf6VnfLCX8r3hVcaXFmVYmOLweQTWIuoMgOtXWO4s06mx
         ZAmNz5a+xWFcgPPd0lpyGRRSAetJE0sgpWUULIKQ+AGP3z7Kiy8nnWSEI4shOKk/4YAo
         6bC4bYZhHVsnX+b/rRawkuXppdI/Mzs57bOlQx1hf43p65tVvnji5oQLOUVHQOQQrW/V
         WpTwyepJ9HC1JsDcHYYmppCMrGgxIDV5uuiVq0gTgjP/2VmIhuq331BU03KeGxJKQi67
         DX+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ImRSkLly;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kj26-20020a056214529a00b0066d04374288si9879056qvb.590.2023.11.21.07.00.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 07:00:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ImRSkLly;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r5SEJ-00065p-W7; Tue, 21 Nov 2023 10:00:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1r5SEH-000655-W6
 for qemu-devel@nongnu.org; Tue, 21 Nov 2023 09:59:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1r5SEF-0004ER-Iq
 for qemu-devel@nongnu.org; Tue, 21 Nov 2023 09:59:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700578794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9+e37xbCO7NQITrKR48ai04nJ1t0h0koWejgbUaE2q0=;
 b=ImRSkLlyOwdnIUHZrdxQ49UZDqMW8SmdqVnsWOMONJ3MgNpm89MKgD0zn7ZTf0bssBraig
 A1ps06ZDeI/EITUYOZlRHeu2kjYELz0sN1hWkjCiwimCP3RwOUC0egJWQtCa/9b9qrCSda
 OXTTjCdf4fmrGC1ZMvoviTNHD0EY34g=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-74UUXE4xPnesDeg0qJTTbA-1; Tue, 21 Nov 2023 09:59:53 -0500
X-MC-Unique: 74UUXE4xPnesDeg0qJTTbA-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7789cde7421so50414185a.1
 for <qemu-devel@nongnu.org>; Tue, 21 Nov 2023 06:59:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700578793; x=1701183593;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9+e37xbCO7NQITrKR48ai04nJ1t0h0koWejgbUaE2q0=;
 b=s1XlSH5V1DtTd5sC5c79zIbm39cN7u0iLnuEV2mLSjS9zrfhhw0WJAHNt+aK+UW2M1
 cC+hMg0P/bfoxUEddkE4b851eyo4B/pb13QEBLHV8dVBEXcgrvjMcGVHzgutoWrXDkre
 mBuLDyJM0Ym3q8p8Ng59RidKQTfQNjx0qfxlo18394bKMGq59PR58T+jgf7A+lJwjMQv
 dO8aRfF6r6E6BH7ZDmNsQpnkootbI0s4Wo0QZZBKUS9UEHau7APdrJBHcp0DXQjYsXJ7
 iLR3AeCJWlHDGRRxW90OEYMWArguTX2S3T2XNIYYUsh5oK9iQrTQABAj1H7E7ch1SGqu
 svaw==
X-Gm-Message-State: AOJu0Yw8pTEn2OjrG8b8Jx+kcEQrK0GU1G18cdoARVW8qk8pEvBJgJdb
 NB1QgBZYhrt5FxtGeebGEBKrGO8vTdCxRMAVE7bbAj+sz94lHHLhpDEqgAzG49Wd86vCvgNoFJv
 dvL+hv+8wMl/XTTU=
X-Received: by 2002:a05:620a:430d:b0:773:a789:cd15 with SMTP id
 u13-20020a05620a430d00b00773a789cd15mr11092994qko.6.1700578793159; 
 Tue, 21 Nov 2023 06:59:53 -0800 (PST)
X-Received: by 2002:a05:620a:430d:b0:773:a789:cd15 with SMTP id
 u13-20020a05620a430d00b00773a789cd15mr11092974qko.6.1700578792936; 
 Tue, 21 Nov 2023 06:59:52 -0800 (PST)
Received: from x1n (cpe688f2e2cb7c3-cm688f2e2cb7c0.cpe.net.cable.rogers.com.
 [99.254.121.117]) by smtp.gmail.com with ESMTPSA id
 bq42-20020a05620a46aa00b0077d606bec92sm114351qkb.108.2023.11.21.06.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 06:59:52 -0800 (PST)
Date: Tue, 21 Nov 2023 09:59:51 -0500
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH-for-9.0 08/25] memory: Have
 memory_region_init_rom_device_nomigrate() return a boolean
Message-ID: <ZVzF51ec3ttSXl8b@x1n>
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-9-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231120213301.24349-9-philmd@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: U7jGmrs5+eKC

On Mon, Nov 20, 2023 at 10:32:42PM +0100, Philippe Mathieu-Daudé wrote:
> Following the example documented since commit e3fe3988d7 ("error:
> Document Error API usage rules"), have cpu_exec_realizefn()

same

> return a boolean indicating whether an error is set or not.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

