Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp285336lfm;
        Thu, 20 May 2021 08:46:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/ypjXYEXKWVBECZp1azsWe4KIPs3T7nIQfSsvvdwFAEw8JYiC3dDXMfSZpW8d8xLOOuCV
X-Received: by 2002:a05:6e02:11b3:: with SMTP id 19mr5766226ilj.41.1621525565239;
        Thu, 20 May 2021 08:46:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621525565; cv=none;
        d=google.com; s=arc-20160816;
        b=ZvazfYBiVLOfrV0o/9yVjSljHmqyFuOYELzremu/YZ+GLN+1H9i0+WfokgdPyEGKhN
         IAYqJ9dzTXZzKN15TgniXOi91GGik5KvOH/q+K+eobTwLDHkNPRHh9bxCOQwK7CEx4HV
         44mOuioZx4FPVSZZtR/8h1/JCPVEUMXGpBfudam0o6dzEjHGXpouGS6P4rAGp9vm+V3b
         UXffyM0dFAa9YFgO5s64B9U+omW8cpo8F+Nv+LSynMtG/wQ+Wi6IsRQbAoekDZ6jGMCg
         ttVDtjSTAhCg3yxjfdDAgd9dFD4ZOeBmwqzs8897XC5gcqp3dXFFP+Qafm28O2x6Jm3Q
         qz3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I6O8/L3ylxIpnQe9NkcAetgPjV6Xg3rsE+K/q/jQeh0=;
        b=WtVKcbYebqYgbg9rG9ediWtzNxsUf0dS6o4P3JuLAbUpde25c70oxs0NlNyGmygkDd
         hCZygckatDd9y44WexMnPCIiOctNnrLbA3YGigMKPO13Axv8dvl0f8V1QQ2VJMg4kodU
         Ug2+Eh2TGEHpLeQOi2BExE3KVrCqe5Zv6JyTgwqVxZHFw8WVcLGLUjJrBD/IRzQjk5kQ
         lMh1BbOGJ6WcHWmlqmdGMNDhuzVDszItgyx6E9popDMlvCBgRV5C7roUZX7kqcbqKKFb
         RTt4eUzVGN/fe57H8qhtHsFRNwa/1y2ipURB4EXFASz3febjpNggYOnA/zQpffr5mWmv
         nctQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W6ZmMg9q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8si2717933ilo.3.2021.05.20.08.46.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 May 2021 08:46:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W6ZmMg9q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljks8-0007wT-JO
	for alex.bennee@linaro.org; Thu, 20 May 2021 11:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkrP-0007vw-J0
 for qemu-arm@nongnu.org; Thu, 20 May 2021 11:45:19 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:37631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkrO-00088O-4w
 for qemu-arm@nongnu.org; Thu, 20 May 2021 11:45:19 -0400
Received: by mail-ej1-x633.google.com with SMTP id et19so18992283ejc.4
 for <qemu-arm@nongnu.org>; Thu, 20 May 2021 08:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I6O8/L3ylxIpnQe9NkcAetgPjV6Xg3rsE+K/q/jQeh0=;
 b=W6ZmMg9qp+HDBXl8qWCRbf33Z0Zr/BeDF3LoknVn+sRmccnBbXG02UJGeAd1uRedVp
 quVN+N1t8bxON2jhn0dQH4eq70IYOGN+YhNZyWiYOd0GbHlcfJr+LrF0GAMYKoRuJvKW
 qkJABAqEHWqtEGXuQWMcGRoTv3aqAuNDCIuLKZ/9YfIwXJ4AFstIRNm6ZYax3HN6+nQQ
 QaK9ZRYBSnyKT7pF4zUw7hm6vry/cE7rlZzlwcXe+58wK6THCLm4GGmkOnsDvKBK1gQl
 wbxUmNNJnqSIPAItOrgthFehwLMqmTBdV/dCUM3/ZYp2lusLw+U252cocdhtvvSVKFZl
 zqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I6O8/L3ylxIpnQe9NkcAetgPjV6Xg3rsE+K/q/jQeh0=;
 b=PbJ8XXU8K7IKiaD6/RZq87b1kY85xhQazVbYEEThTV9vd10KHFS8RguHKmMVxg7qBT
 eVI0ih51WFbIpNKnUqSZKYjFREgftAxNsD6WhA0e05inGdI0jHl00b+9OBkCJGG5e/Cl
 E/LqtdEWw8sv19bfA5Zd9EpU5QOafwMa8oSd/qG7D4SbUyDfqB0wrfhOaUglmc0DCFqW
 J4Lz8+f/07KFpn4FS8jgH5jEvu/opylbbCO2eFciKd3VWJZEl3O7a5sOo2+MdFarnRXl
 hJ54zHAw/lPWQ4lI5rrL9zrANhTz/QRf8IjT/3xClcD/yWHtIXllm6mEXnONPlGfaEYd
 N1IA==
X-Gm-Message-State: AOAM531A0ci+ImP80Kl/qOza7uIuIuxhiRRykMEsHEVH0IQkx9+4a/5e
 JwdFfWIOf9u+eqj4nZKCnHK8f6vbMUOPKhtH+6hwBA==
X-Received: by 2002:a17:906:d8cb:: with SMTP id
 re11mr5364132ejb.482.1621525516235; 
 Thu, 20 May 2021 08:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210510124747.780877-1-eric.auger@redhat.com>
In-Reply-To: <20210510124747.780877-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 May 2021 16:44:57 +0100
Message-ID: <CAFEAcA88KZSL6V5c7PmRSKvcT38OghVH_sRHgXddJOZ2HdPUsQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm/smmuv3: Another range invalidation fix
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kunkun Jiang <jiangkunkun@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zbUSl1Kic9Sm

On Mon, 10 May 2021 at 13:48, Eric Auger <eric.auger@redhat.com> wrote:
>
> 6d9cd115b9 ("hw/arm/smmuv3: Enforce invalidation on a power of two range")
> failed to completely fix misalignment issues with range
> invalidation. For instance invalidations patterns like "invalidate 32
> 4kB pages starting from 0xff395000 are not correctly handled" due
> to the fact the previous fix only made sure the number of invalidated
> pages were a power of 2 but did not properly handle the start
> address was not aligned with the range. This can be noticed when
> boothing a fedora 33 with protected virtio-blk-pci.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Fixes: 6d9cd115b9 ("hw/arm/smmuv3: Enforce invalidation on a power of two range")
>
> ---



Applied to target-arm.next, thanks.

-- PMM
