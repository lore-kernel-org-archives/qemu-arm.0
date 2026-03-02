Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1D7EB3625
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 17:35:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vx7AV-0004YI-M6; Mon, 02 Mar 2026 12:34:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vx7AP-0004Xc-BW
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 12:34:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vx7AM-0002Cz-37
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 12:34:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772472883;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FlWky5MhbdLuEP+OjyOBwrSQvDd6/6/EGoLoT+mybGE=;
 b=LObuVxIKLoB+BJ401Cy2acRBLhNSdAIPIIB99HI5/NpC4PlJdOgFen0YLtoh6RxGxYla5D
 vNYk8AN/q7PP3FpEKsyUtJcI76wjNfCPPZyGYhiApG3dG2SoP99sKSu0m1pDQjcsFbxF4a
 dyGJyjwZoOeeilICxvKDcYrXLLMM+w8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-XHoz4K7_O2yLoLUWdW_qng-1; Mon, 02 Mar 2026 12:34:42 -0500
X-MC-Unique: XHoz4K7_O2yLoLUWdW_qng-1
X-Mimecast-MFC-AGG-ID: XHoz4K7_O2yLoLUWdW_qng_1772472881
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4836cf00787so53228225e9.1
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 09:34:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772472881; x=1773077681;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FlWky5MhbdLuEP+OjyOBwrSQvDd6/6/EGoLoT+mybGE=;
 b=RyDXfS5YxUkj38sV2YfWfoKMXHgPdlxMvxYNA4Fl5UgdZPuscEvP2v56IYQuWALSMN
 OZjqlf/z7Vb+K+aUobRZ/doxh8/0yQ56DZ/RC5fsee/NAOXv7bxf3kITcbwzEeC2IjsL
 jZLdQ1beXUgbdhody8VlpzKd/mulKdWs30gJuOYdzJY/bbleHZTkCAJPdYqU3+3uqbcy
 eq1Kp+QSj8tCrUfYfqQYmS9z6oHlx1KHsxkBJ33iTHO0zzGTf9e7+ZDxPgP0b6UQ37HZ
 fuILq7YAdgJ/t98PdNhVzRDikWmAmjgPencxLXRJkLlE1wSkC6jYkGBdiqKb/sQqVY4K
 udsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXDyezihylbU/vmMzca1+zeV4q6oS80Mlb+oa4FnuNYLdJWuPdSX4ccoYksbgoIPVlO2VniuCuHg==@nongnu.org
X-Gm-Message-State: AOJu0Ywu3JMhqfRJGixej39TsRNBP2pGV6t87iXZadguYlywz1ve4ZyT
 KTiGzrLT4KMoLSyJlEVFU5Jif2fwbr4kDJ2beerGq7UItwhDHdg5gY/maBXWfmmFG+Nn+OsqO3t
 RDQ81XGC/ycb2ZWrstuWIirbk4tSjxv1oFXcA8aWMfRGo7cWlC9jWsA==
X-Gm-Gg: ATEYQzwKS5TSBDxVHFMZqUy8lvTzYSq4TAXuRbiwR90hmR/lDobOA+EQuoYnL2RbfvN
 4lJNP+9n3QnQN+TMkzUSHOJ6eAKiAg4Oze42j/0C+AZnBcja7yO3qJstESetBhEAiDOrFi294Qg
 0baOQK4QtI35FWus9trYDxdDTaVa0eWvEZnTr9oEqsaVHxs3NYCDn0mA428PuS56iYHCBJ/V5+J
 Z6wLx8ojs9IP9i0r43qwBp/gHcXLjrdpom/Ih0H/fbmcMT3bur9knw5lB/E8mRQOkCl9KbF44k2
 KfDaDITLcx9RMhI0bfifivgr4oKziy6PKQi+V3loZxeKRpR8jdYndopjxURIHIdUnFSNbuJAB1Q
 dJTKGOGsOD2D2Yyk14vr6/QG+iA89qCvlKKLBee2ybbKX2smNH4/4grt89Qv+HnrWOTUp5g==
X-Received: by 2002:a05:600c:4e15:b0:483:29f4:26b3 with SMTP id
 5b1f17b1804b1-483c9906a11mr242387735e9.1.1772472881158; 
 Mon, 02 Mar 2026 09:34:41 -0800 (PST)
X-Received: by 2002:a05:600c:4e15:b0:483:29f4:26b3 with SMTP id
 5b1f17b1804b1-483c9906a11mr242387165e9.1.1772472880700; 
 Mon, 02 Mar 2026 09:34:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd750701sm443972155e9.11.2026.03.02.09.34.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 09:34:40 -0800 (PST)
Message-ID: <3dd493e0-4788-4b91-9c2c-565938561bc3@redhat.com>
Date: Mon, 2 Mar 2026 18:34:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 13/31] hw/arm/smmu-common: Add sec_sid field to TLB
 entries
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu.zevorn@gmail.com>
References: <20260221100250.2976287-1-tangtao1634@phytium.com.cn>
 <20260221101640.2993566-1-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260221101640.2993566-1-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YIky4AjuEa4uof56xNQYb1nr-JG0Aelyp3cR2PhHNLw_1772472881
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.968, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.495,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 2/21/26 11:16 AM, Tao Tang wrote:
> This is a non-functional preparation step that adds storage for
> resolved security state in SMMUTLBEntry.

Add the "why"in the commit description.
>
> Together with the earlier commits that added NSCFG handling and
> PTE NS/NSTable helpers, the plumbing is complete and we can now
> refactor the PTW flow to handle Secure state.
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>  include/hw/arm/smmu-common.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index bd88e599c77..b0a02e12fe6 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -91,6 +91,7 @@ typedef struct SMMUTLBEntry {
>      uint8_t level;
>      uint8_t granule;
>      IOMMUAccessFlags parent_perm;
> +    SMMUSecSID sec_sid;
>  } SMMUTLBEntry;
what does it need to be part of the actual entry and not only of the key?

Eric
>  
>  /* Stage-2 configuration. */


