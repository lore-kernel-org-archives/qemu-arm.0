Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1993531lfg;
        Mon, 8 Mar 2021 08:40:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMjcl9lmQ7jXBTcacpKETu7GbX+2SGpgN4meHZmY9H+p2eavzfOR5jw1dRy4cBKEPOhBRo
X-Received: by 2002:a05:6638:3884:: with SMTP id b4mr9020137jav.18.1615221602419;
        Mon, 08 Mar 2021 08:40:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615221602; cv=none;
        d=google.com; s=arc-20160816;
        b=nS+nlVo7xHZTz7G/Yg9XDiC8Cr9Ed5tg9pgMuL7a3B9nKbZLZC3Hi5aZz0Ow25Fiw/
         hWitVPbRAHDkIN6aOZeKPrODrjsAemcSYLYgydq6pEAvbBdYzrUw7rdHyVuU5Idg8JJS
         Fl+KWLSzBJGZtSDWifS1bddplwqs9c+Ux4u6Tzn4k9hsXJhfTyVVLPZyPH1umiwk0eJM
         /Hjaou11gi7mDA3V7JqA/aWCuuman24/2U4a2CMkcLlo1rlH32O8Tb3El6V6gmcgH27j
         8bw5F3orWEYPKZiXHeb0Jrtc3hyx589HTyZlHBK5bg6o6FT/9A7YNmndcpESdRt55zUa
         aguw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hdt0UPv1+JtE9WePGEuObIpZA5lYDhWSWdUZ/7HI64M=;
        b=F2WehAfi06KhsDAXZBWsllFqR+sVKwaoT0TKMS0rj52PF3RsFzbmKv07yinMfvMM7j
         JclIm+rboX/55X5+cKYquM4TBM2ub9SbB8k9uLi+Vo40vDr5EbVVOnbP4MjEjRVB5kWr
         rvg1sm2znt4teigVSpvm0kSWHqA6sEF2WxlPIeWgsTahp7TrQJZO8ZAefThTEedsE52Y
         Xs4vwDt8p+dvcjMZOKV8j+ZCl4t75OwxwZD10oaofDohG82Xwg2ypYZS2nzRZDwXsthB
         Lk3uuAy9qGUELzgWc0DAe0eEwXCoH1C654gKIbUUlUXqp6EiqXOBY1o3l7g9dehyafZZ
         4DNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bVjdIRx+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b9si10424958ior.88.2021.03.08.08.40.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Mar 2021 08:40:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bVjdIRx+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJIvJ-0007Uz-Oe
	for alex.bennee@linaro.org; Mon, 08 Mar 2021 11:40:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJItC-0004gu-GD
 for qemu-arm@nongnu.org; Mon, 08 Mar 2021 11:37:50 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:41064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJIt8-0000dF-8f
 for qemu-arm@nongnu.org; Mon, 08 Mar 2021 11:37:50 -0500
Received: by mail-ej1-x629.google.com with SMTP id lr13so21681056ejb.8
 for <qemu-arm@nongnu.org>; Mon, 08 Mar 2021 08:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hdt0UPv1+JtE9WePGEuObIpZA5lYDhWSWdUZ/7HI64M=;
 b=bVjdIRx+u2Ravu+DV7y+kPgj6FXGmw1P2JNeCkVzho/S36Uc3n7jPKDCWw/ZpWBWUZ
 j6i3lwbQKF8+osWhXvrCchkFIRucMWbjKIOOK7qfQtg/blUl3Auh0W50g4AefzY4JJUO
 CM4ulnWqtvFW2XzjL1WcVsJh7AN3lM9QM/h50FCdsXw/u4VCQY8WhqrUIgHijXBRtXvI
 Aq6mJi4U/NWJBvvahGoMgFzivMrDMet7GYfVNGvWJR8Lx4k3iftSS7bMV7Q9HJd4R1qM
 ib45p1LofqCMkF0hqffd4Z6B6ixrLmkZTN3+TzSLlHQ1HnuZ4lhTQksf1GA+E9g1R18K
 KwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hdt0UPv1+JtE9WePGEuObIpZA5lYDhWSWdUZ/7HI64M=;
 b=VYk7JUafyO+GRNzQNIAK6VWw/cooE0dwvyBlhJY7PBYsOHCfcGR2w5o+wBNskOL6i5
 Atde6N8JoLeROz993Dcy3Rtc4pcJPIGcOgE1K/W5RVyB+dPgXhwmkRbYR53c4iD8yrG1
 8vserSd65HCFebFwvz6l7H0UCa21MEouKcJiXFqwgVZHiDrsSkACuiE5T2H7956M4ccU
 O1kllpcvINxvkSlR7N6gtp+AO04AjWFkYvA/yvRWxUPZXaJtXchZbTPEyHzmRBt/QQDn
 pJk2sNCllOf8N9Ty27aOEK0FSRWQzv5ySrvuQ4zLYprVdo3Km6tbxdfcBXx0KjpvxfM3
 pWxA==
X-Gm-Message-State: AOAM532eEqF9fA5znTBbYL5bDaLEAuKNNHgeED254bvsikiTm2ZM3QBg
 V/TEwmRSS9iMhtL2CyHPYpWWJUAbH4nV6wjjeoo5uQ==
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr16219958ejc.250.1615221463915; 
 Mon, 08 Mar 2021 08:37:43 -0800 (PST)
MIME-Version: 1.0
References: <20210225091435.644762-1-eric.auger@redhat.com>
 <20210225091435.644762-5-eric.auger@redhat.com>
In-Reply-To: <20210225091435.644762-5-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Mar 2021 16:37:27 +0000
Message-ID: <CAFEAcA_ZTJUD1SfbAX07uk+WceO_NvqE_i+NrHF13bAOmfF3nw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] hw/arm/smmu-common: Fix smmu_iotlb_inv_iova when
 asid is not set
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, vivek.gautam@arm.com,
 qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QZ/Ffj9PkXOU

On Thu, 25 Feb 2021 at 09:15, Eric Auger <eric.auger@redhat.com> wrote:
>
> If the asid is not set, do not attempt to locate the key directly
> as all inserted keys have a valid asid.
>
> Use g_hash_table_foreach_remove instead.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/smmu-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 405d5c5325..e9ca3aebb2 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -151,7 +151,7 @@ inline void
>  smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
>                      uint8_t tg, uint64_t num_pages, uint8_t ttl)
>  {
> -    if (ttl && (num_pages == 1)) {
> +    if (ttl && (num_pages == 1) && (asid >= 0)) {
>          SMMUIOTLBKey key = smmu_get_iotlb_key(asid, iova, tg, ttl);
>
>          g_hash_table_remove(s->iotlb, &key);

Do we also need to avoid the remove-by-key codepath if
the tg is not set ?

thanks
-- PMM
