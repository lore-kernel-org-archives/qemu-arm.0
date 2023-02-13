Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp362353ejb;
        Mon, 13 Feb 2023 08:49:54 -0800 (PST)
X-Google-Smtp-Source: AK7set+fz8bwItux4x5OF39ANuJzDgIRN3oOHmFrdc+yKv18nK87I6qF/HIEW+wDy0ywgPfAyBxu
X-Received: by 2002:a05:622a:118d:b0:3b8:2ce4:3e9 with SMTP id m13-20020a05622a118d00b003b82ce403e9mr46243777qtk.32.1676306993835;
        Mon, 13 Feb 2023 08:49:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676306993; cv=none;
        d=google.com; s=arc-20160816;
        b=sSaSIb8omkGzZvOcZQX3olbCxNF0Lib/6YnRmBGexJGyRjYmjmXlp9W8H4CuRC9wxN
         lMORQFBAFVpAGD9lf3oWG77ugSwDvnO5zyAPnflm0AF4K1lqY3Oe678pt3XqGLK2M09/
         Btn8aobc3A6+JFfOlU7aNWD2Vw1wWOHMVt+alkNLCE2QZsavHFNa4kHhrzzPr2LStpPk
         aIxONE6pwB3p0f/oRwRaWE6R4zHgI4BkTdgeEEupAHrF1plBr0GAkA7BzYrcwqubrO8t
         sRKG7PbHisVJKf2KpjmT+9ClRdRDwA3/zp8OFJtIDLoEE08PZJBvPaKFn4gkKvQYhCxR
         SdkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=SjhdaFFgnmqHymwkmWoJkLQQlk8VxnXMaojuygbN39g=;
        b=YgbuI/Mos2ewvga/ftNzCEYJemG8UrLzkk+PDeSpU0vXJOpiIV3MnsDjY2xD+tGFme
         HpNQMJLKmtqxWtLTbbACcfN4MHdwYTiZSTVLM14BW2MQKtoytizjD5OL/glOTc9OftIV
         YJerbxsObH78uxwx9AbeD4Xi6gydnpRLfM4FFQe0gMpu9uiiwzSZEMXpmWzPH6r2qQxr
         B0XFvQLGR7HRT8+zSavCe3iLDT4aKGhBpW0d+XjtocNKuD87iJhFoLAW4YD33qoyUl6n
         a00Lm8pR8HCVxrkBN17l2r3r19mulPLF8Je3/8uA0EFWCZgsY40kMcTH6uSwPV+XbZ4m
         +62w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="BELj/s+y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t37-20020a05622a182500b003b9ca95da74si9808547qtc.186.2023.02.13.08.49.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Feb 2023 08:49:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="BELj/s+y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pRc1K-0006RG-HL; Mon, 13 Feb 2023 11:49:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pRc1I-0006QX-Mh
 for qemu-arm@nongnu.org; Mon, 13 Feb 2023 11:49:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pRc1E-0004vc-Lj
 for qemu-arm@nongnu.org; Mon, 13 Feb 2023 11:49:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676306971;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SjhdaFFgnmqHymwkmWoJkLQQlk8VxnXMaojuygbN39g=;
 b=BELj/s+yZxbQt8LYrMjJ7lMgc1r46hacdsVsi0Ec2zTBZb6uxc/OkDVNHelf/bWb0Lm3S6
 hgIL2jvbPx7luR5ake710hLZa+FkFKUI0mzBfM2WdHNgx+FQsH2099+pMiFvk4x5KI2IfT
 CXFo/QEiOobisAetSjFvT2Bj8XkqWtQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-341-0WSKLhEEP_Kr9uK5Arj6Bw-1; Mon, 13 Feb 2023 11:49:27 -0500
X-MC-Unique: 0WSKLhEEP_Kr9uK5Arj6Bw-1
Received: by mail-qt1-f197.google.com with SMTP id
 i5-20020ac813c5000000b003b86b748aadso7772644qtj.14
 for <qemu-arm@nongnu.org>; Mon, 13 Feb 2023 08:49:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SjhdaFFgnmqHymwkmWoJkLQQlk8VxnXMaojuygbN39g=;
 b=HB0w109BmzgVh9uWiOJ5q6gtbbuFk90nBptj6k3j9G/wK90cIVzuxyvQBzOBe81u+M
 Myjg5VaN5+eY5gYr/kdFhjPGdj0u5MhX3QjEsb++VCkMKIyoEdThwBnZoru/8cd2L3CX
 fkClARWXMsPoxBlydgaWMYlfdz65SDR9iTNIDbqkb30H/gqSevXyapfmeTZ/+Zai+aCt
 7mr1TblQ8vTRcmXUo+44Ayz2WRbPi+3jWWbumU7UJW8O5Vcqu7IQt3anrGmik9qb5dTL
 OCARS6P3Iu3nTdwIRNijyBXNjBwdIjy8G91aK+Lp11iiJ3b6o5UMBSgs3ZiF6De9u/Fq
 kziA==
X-Gm-Message-State: AO0yUKVPxuY+RE3Q6BNM/8ypFJiU2eA4LdEwRxRprH0XfzigREYyM+1Z
 gfDWKuG4lka0XdHCTwl+fl4mPqs2U+vd7EzmrwmIHr8VKMM+BWMPPimYKO5DUyhWc+3XpKH+tti
 T9NUbe4oyHmnR
X-Received: by 2002:a05:622a:196:b0:3b8:73c:15e6 with SMTP id
 s22-20020a05622a019600b003b8073c15e6mr46266003qtw.18.1676306966657; 
 Mon, 13 Feb 2023 08:49:26 -0800 (PST)
X-Received: by 2002:a05:622a:196:b0:3b8:73c:15e6 with SMTP id
 s22-20020a05622a019600b003b8073c15e6mr46265970qtw.18.1676306966420; 
 Mon, 13 Feb 2023 08:49:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 c26-20020ac84e1a000000b003a5c6ad428asm9395954qtw.92.2023.02.13.08.49.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 08:49:25 -0800 (PST)
Message-ID: <5c61304d-d41e-3da0-e80f-31747db8b996@redhat.com>
Date: Mon, 13 Feb 2023 17:49:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4] hw/arm/smmuv3: Add GBPA register
To: Richard Henderson <richard.henderson@linaro.org>,
 Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230210221951.1298668-1-smostafa@google.com>
 <2de9abc0-8354-0cc1-dedd-5d4692afc54c@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <2de9abc0-8354-0cc1-dedd-5d4692afc54c@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.345, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ob1WMdw2DG1k

Hi Mostafa,

On 2/12/23 00:34, Richard Henderson wrote:
> On 2/10/23 12:19, Mostafa Saleh wrote:
>> +static bool smmuv3_gbpa_needed(void *opaque)
>> +{
>> +    SMMUv3State *s = opaque;
>> +
>> +    /* Only migrate GBPA if it has different reset value. */
>> +    if (s->gbpa != SMMU_GBPA_RESET_VAL) {
>> +        return true;
>> +    }
>> +
>> +    return false;
>
> Just "return s->gbpa != SMMU_GBPA_RESET_VAL;".
>
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

With this suggestion, it looks good to me.

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric


>
>
> r~
>

