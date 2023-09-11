Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp1537739ejx;
        Mon, 11 Sep 2023 11:40:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW8+o8c5ao4Vq8ePsYHq1TwAC64liiX2aJqgTCXUuo9w7qE2NGo2ALsJTu1P0PbbEDv/7Q
X-Received: by 2002:a05:622a:1b91:b0:3fd:de11:d8e4 with SMTP id bp17-20020a05622a1b9100b003fdde11d8e4mr12514903qtb.23.1694457658471;
        Mon, 11 Sep 2023 11:40:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694457658; cv=none;
        d=google.com; s=arc-20160816;
        b=w3URCaW1YJhWzPFMzOZN9o77ULKhOlui0wsAqKZ5VKEy5tRkZPldKcpmp8WMykBIE1
         IsjO6ch/0rAxqkjgrbxxQ9MrYDxTeDg5yrT210WzlHuThgzdWvHCU+JbRy73QNIwC1aO
         tX34ifOEOit1iyI6H75q+wYWzkb/IlCLQC4FLiOFk5rhuNFajBc8Am/nJCaE3WJPkrcE
         gtT6yxIJUb+fLvRbpxGBXPScsaYK9bV6RDdvuYOL4eJYY8ldu83sPKk/dcVLTJVvGq+E
         2MyzcsQznU7SR5A1/Yxfsn8oOMnd6vP3TQPGvG+FIA9w59QLBeNRNYzFGUTi9JQbGSfy
         3Qzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=nasu9EpN3g3kNe1u8UqhUn3yW+PmZuz6LASO3KzJc54=;
        fh=BsOjEjkAxgjs1IoHYi4/BRH6As/6MNWA8nrKb9fJvr8=;
        b=JOJPe52aeEOvA04mb/mKRL7m7dlsFAjBAuuPQVpkJeVNFioNpDIv9Ur9w9a5/jYHU1
         dBad85ZvBBNnfu9KAYbW5e782+yE92HE7pA5Uxefq0LiTzx66Vg6KFdYqTHzxut7DS12
         GnV2cSNUY5A3x4ss9NP003xW0BKFL79vADcDX94eqQW0MPn3aGm0kABoYumKEi9t5Mko
         1B+WLyY3JeYR4DwCYFmDTp44eKEZRtZux+KbWD0+4++VQSnmGFwO6+RtvYQMMtGfXQrZ
         NgypE2ggN2kdOU5og6cDyjQpe5InaxpI9QErCsKr3q9HZY3pMm7JzkJi8FgKXFR5CJUt
         HLtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ECpghiln;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4-20020ac85904000000b004108a00ae11si5219575qty.553.2023.09.11.11.40.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Sep 2023 11:40:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ECpghiln;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qflpv-0003YN-SD; Mon, 11 Sep 2023 14:40:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1qflpn-0003Xm-C2
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 14:40:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1qflpk-0000nZ-Ct
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 14:40:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694457625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nasu9EpN3g3kNe1u8UqhUn3yW+PmZuz6LASO3KzJc54=;
 b=ECpghiln7se9QXM6fscxaHfB7OHpczoZyq5n52czvSq18GRQxcsNmThnjdkijMsTSWGTQt
 nMcpkIc0+yXknTY6i7l+WfsdWuHptzGIJ36GWvYuyMJ/vq2LHg4n5kjulZD9NX94igY9Xd
 ZNfBw7r6IfDOaxoCUQTjnyhr9re4t1U=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-IxMcMhV8PFiiB4EG1CPvnw-1; Mon, 11 Sep 2023 14:40:23 -0400
X-MC-Unique: IxMcMhV8PFiiB4EG1CPvnw-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-1a9e3f67989so1279327fac.1
 for <qemu-arm@nongnu.org>; Mon, 11 Sep 2023 11:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694457623; x=1695062423;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nasu9EpN3g3kNe1u8UqhUn3yW+PmZuz6LASO3KzJc54=;
 b=q94UPQWP6acjB3zkAO5Ys1b/ye6PEoVgXNbw7R8GjsGFwtOMh8At8yz3g/nvq+Zxq6
 yWrtmopYD6oImA4oep1zqn8Szue15dq04If7B9S4jOgqWw92iYB42yTPQOFiGmFOlfNE
 KK+ZlKFkzZ3zF77DgXblcwFC377cGIB6JYy7nTzPn9qhL3ZzmK1P8SrdHxxnJ4qlJzQu
 fa6m71qqwbzuqGlcyndSGUrJl0tfnW7Cj07lXOm81BccALJMmDnLrzH4v0ss+ISXt5ZX
 qfKlUT9olrtg59WRDny3GbxZOpWgFGbwsSM58u/a3bFXS6lcA+QD5rVXZkx8zkAj1esB
 pYSg==
X-Gm-Message-State: AOJu0YxNqjLwZdRmH2BvGz4vxw8NQiBFfE90AFkXRQYv/jrleNnLCTwj
 +9Fj2J/hPAcP252FFWr85RXlhc239PMUO9qqHZ0uGeZJDJEKbM09ldVdwYO7bDOLSiS95njZIlq
 220QkqsMzhkts
X-Received: by 2002:a05:6358:45d:b0:13f:1503:92f8 with SMTP id
 29-20020a056358045d00b0013f150392f8mr6860331rwe.2.1694457622852; 
 Mon, 11 Sep 2023 11:40:22 -0700 (PDT)
X-Received: by 2002:a05:6358:45d:b0:13f:1503:92f8 with SMTP id
 29-20020a056358045d00b0013f150392f8mr6860318rwe.2.1694457622506; 
 Mon, 11 Sep 2023 11:40:22 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com.
 [99.254.144.39]) by smtp.gmail.com with ESMTPSA id
 d10-20020a05620a136a00b0076827ce13f6sm2693648qkl.10.2023.09.11.11.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 11:40:22 -0700 (PDT)
Date: Mon, 11 Sep 2023 14:40:19 -0400
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 alex.williamson@redhat.com, clg@redhat.com,
 jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com,
 peter.maydell@linaro.org, david@redhat.com, philmd@linaro.org
Subject: Re: [PATCH 01/13] memory: Let ReservedRegion use Range
Message-ID: <ZP9fE32QCaU0SnLL@x1n>
References: <20230904080451.424731-1-eric.auger@redhat.com>
 <20230904080451.424731-2-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230904080451.424731-2-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uhi+SDYOJfbf

On Mon, Sep 04, 2023 at 10:03:44AM +0200, Eric Auger wrote:
> A reserved region is a range tagged with a type. Let's directly use
> the Range type in the prospect to reuse some of the library helpers
> shipped with the Range type.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

