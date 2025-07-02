Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3644293dye;
        Wed, 2 Jul 2025 00:49:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV7HSWNxoSrh0YFfaYATsVwgxlV/l7TKyRbA0knVL65g2OmOX+PPKrUiNkTSPVIW+NF5ziRnboXumuR2A==@linaro.org
X-Google-Smtp-Source: AGHT+IExWPEokugggq2qWvzA2e96OS4c05De0lwq1H3pNVLj40vaIUY/OJ8coKi6aPxoTbf8Gcw6
X-Received: by 2002:a05:622a:4c14:b0:48e:5cda:d04e with SMTP id d75a77b69052e-4a976a53cb0mr28928951cf.36.1751442590752;
        Wed, 02 Jul 2025 00:49:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751442590; cv=none;
        d=google.com; s=arc-20240605;
        b=JJVHCnCubPu3tys4nH+gQeZpzWOneRtLLlfMLqb9xIqJfuanpYwZgo6e7ROXV5ABZQ
         T8KDEEPD2rG4Bg97ATtldHj5iVFmstmNVMZXT123O8ecED2wCMPuOiHPRRWFeE3m6I6q
         JPuwHPJZS9o6961T8E3AVHndsjLRp/xaFNr/jVxuDbWjDxBpl4kLsWAbzjKZWDnaZZhM
         UVNOdN3t8dnXjvLUig8DDqnV1HWdTFrq/GriuhTpwW4DkoacypZJiK9denSi7pm41FJb
         cYBYdyJv6q8+ClDHTuBo+pJ/Xf3WOYdBajfxFP7j8+Mg3WKQykTOmr6dOmc6VOv/9zaY
         O10Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=USuE7m+Uw/y7NqBAo7vHVRkRmvT+v0lBpgBm2OFdnco=;
        fh=2Tv63/QTADoVHjR0dhTjJ3fRHnrKmLXyzBrSxF06lds=;
        b=dlWW1rXqnPY2kDHnJ+3ODO4Jz8D549seKkLSqClTw7jKVnhCmWOB2IAoNf5GtvbopP
         GHG5q/9cj3hcSS3cAzphb6Jw5JiP9AXZVO5hnuU0lCDOXrX128ufxJKMKCyBZSewCvcO
         aVcyB7JGdd0eRuu8OHawK9uaqgbAGEBO3MrHt4LblJbYdDFg4D89gRdjFlRJa6pyQduh
         sbh8tQ2aUZxdIdbjM8ZFbY9YTXqs5gFRFpsFuMppFUemhzJKtVan5ug5nxJ6XNUzobe6
         9RebxxVKX9OYLBBmZsgmBf9/cJ9PIcMeVJ7Ik2akAs5bjZxw6WWRlDXL1gjyBLYvJZpi
         vZww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UIIdWLPa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a97311b906si18806561cf.0.2025.07.02.00.49.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 00:49:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UIIdWLPa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uWsDe-00089W-Fn; Wed, 02 Jul 2025 03:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uWsDb-000897-Au
 for qemu-devel@nongnu.org; Wed, 02 Jul 2025 03:49:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uWsDU-00043l-8M
 for qemu-devel@nongnu.org; Wed, 02 Jul 2025 03:49:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751442555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=USuE7m+Uw/y7NqBAo7vHVRkRmvT+v0lBpgBm2OFdnco=;
 b=UIIdWLPaL2fnpE1y3WQHqf2QuuJTbEm4xp16scU9gZU3yZB3bQ1/Szmd9u97iYsKUJShp/
 ymjoFwR/CQN15ffAX+HRoL1l82rHq0H3BHOzp7Iq87bT0Jopfe0szLvpn7aXAe0FAFiewS
 KqY4wNdeUMYltxOrGxZ9ojZkQyd3XUc=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-wWiA8iPPO-SHeccV_vw88g-1; Wed, 02 Jul 2025 03:49:13 -0400
X-MC-Unique: wWiA8iPPO-SHeccV_vw88g-1
X-Mimecast-MFC-AGG-ID: wWiA8iPPO-SHeccV_vw88g_1751442553
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2382607509fso40079035ad.3
 for <qemu-devel@nongnu.org>; Wed, 02 Jul 2025 00:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751442552; x=1752047352;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=USuE7m+Uw/y7NqBAo7vHVRkRmvT+v0lBpgBm2OFdnco=;
 b=eMaBWUmsgqg30y2FRFdEaCdl03V06sKK7RUsovgBJ7B0XUpT1fbH1/SJL6VJquCAZA
 nUquPQLjjnDXSLFWhqiXKc/MhxwCs/v8yByLD7SlvE+lIpPGuitUCMT2N3luQWbQkvGO
 JPNv0ulgFOUtjR6sZ23yZMof8owe2WBaf5vJLKWnWJaELjAppsT2VzMp4mNQLctS1Qxt
 OnAjgT6KPpaBA1dbe3sJfxjidar6Me/21LwWqM8c1DdnGImPGL0nQV6A9W/IBfxGn7Rn
 s9XHCFtLgVz/C0qGjU5F7BNAk60WKF9/iHlQGxpxsJo/WQUR/2b5dK86q3nYaiW4EXkX
 SANw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4cNelN63sWSUnP0IzgOutxa9KpClvZr80HhTQ7lrVVimHDpIgiMdsWT/+ZBuXkR5ypItSoIfy3pdP@nongnu.org
X-Gm-Message-State: AOJu0YwPnf3xmztw62mKUc/lTvfloDXayQbPhUX3xApRwfQI2/LBpICc
 x5DIKfprwAgtYzwnx6xPZfT5ptDAXahG3vFOR+H8ZLrWVYdwP/SOP9puDlLMreuVBV4ZgMnIF8q
 4E+xmZFfucPigynEC6XqI8INhjdL390GAApXWJ+o1yudkuFI/YU9ut3rs
X-Gm-Gg: ASbGncu/fwn+QoRCUNd5Xy19a86VtOcNZujmb3dukXAlyqlF8pl7RhNWuCrP1L8Ickp
 9oasOwYgFymNF04tgnIqIFP2Zx5+wMY1+y0saXCSujQuvPDJHzhlCJeXuN3X2OeEq+1kl0VSRBz
 wgnyNs4NuUco2gs9LPbq2V+8p8m+XY1wBu7ykKtWf9hpP/yXz2ZN2UnS/QCHuOLK3wpVK5tm3mh
 +v+DkKbk0TaNER7RSGTFPs+4B8WD60scnLFWLmjD/7MCXyox1JkHft14dpiTbSiDyNZvs+3y3iW
 T01L/GYlDP696PVOW7YhPeV6Pw==
X-Received: by 2002:a17:903:2acc:b0:234:986c:66bf with SMTP id
 d9443c01a7336-23c6e4d3049mr24250975ad.11.1751442552263; 
 Wed, 02 Jul 2025 00:49:12 -0700 (PDT)
X-Received: by 2002:a17:903:2acc:b0:234:986c:66bf with SMTP id
 d9443c01a7336-23c6e4d3049mr24250535ad.11.1751442551889; 
 Wed, 02 Jul 2025 00:49:11 -0700 (PDT)
Received: from [10.72.116.77] ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3c70c7sm121812295ad.231.2025.07.02.00.48.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 00:49:11 -0700 (PDT)
Message-ID: <e881139d-dc61-45c5-878d-02ba16aeebc9@redhat.com>
Date: Wed, 2 Jul 2025 15:48:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] hw/i386: Add the ramfb romfile compatibility
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Eric Auger <eauger@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
References: <20250701030549.2153331-1-shahuang@redhat.com>
 <20250701030549.2153331-3-shahuang@redhat.com>
 <9bbaa0bb-cf32-48f2-aff6-6484285496f0@redhat.com>
 <6347e3a2-23f5-43a3-8b74-503148f3bacf@redhat.com>
 <e7f5a70d-a052-4d37-9cec-5c9595559de7@redhat.com>
 <aGTNJAfn8bAnxQzU@intel.com>
Content-Language: en-US
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <aGTNJAfn8bAnxQzU@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=shahuang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: 6X+Ivsg+YRYl

Hi Zhao,

On 7/2/25 2:09 PM, Zhao Liu wrote:
>> One more question, now the qemu doesn't have the hw_compat_10_1, should I
>> first add another patch to add it just like the commit:
>> 0a7c438a42 hw: add compat machines for 10.0
> 
> Hi Shaoqin, I think you can add compat option in hw_compat_10_0. Then
> the compat property will be applied for v10.0 and before. And you can
> find v10.1 won't be affected by compat option you set.
> 
> You can test this with "-machine pc-q35-10.0" or older, with "-machine pc-q35"
> or "-machine pc-q35-10.1".
> 

Thanks for your explaination, it helps a lot.

Thanks,
Shaoqin

>> I think it should have the hw_compat_10_1 first, then I can add the property
>> into it.
> 
> This hw_compat_10_1 will be added when v10.1 is realeased.
> 
> Thanks,
> Zhao
> 

-- 
Shaoqin

