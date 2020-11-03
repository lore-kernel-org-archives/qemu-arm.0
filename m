Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4968615lfa;
        Tue, 3 Nov 2020 09:03:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDiAC9qeqeDchpyX76tKXmXgemlMAW5/4sr03oyioL7Yy4oFXGNMw8PWuriTGjntWKm6aG
X-Received: by 2002:a1c:2842:: with SMTP id o63mr76134wmo.59.1604422980017;
        Tue, 03 Nov 2020 09:03:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604422980; cv=none;
        d=google.com; s=arc-20160816;
        b=kN2IMFPsa6JuRmVngE+nLmTDwki8x8XYHbcqdSKFbJjpMgB/ibODVhu8WivSlWNkXy
         e4ZLxNSxMXQFd8Q6ptLtGc6uE3pedwnynLVgqBGFEMtvnokNnKRqLC/GNh4vtExOcG6s
         cLQ21mmEI0kgVziqzAOFa7n2RFWkKlW2nq8SD+IzGjkObWFwHtO/EzrESnNYKX1QY74E
         n/u6AtaEgpvzRWqqyLGCYu4BGlEPSU3rqauZMss2jwdArqRk3MyW3O5sVKPhbcn0RZPq
         EIb/iUxBWFTV6RCNja5qf9c62tQ5n04MBUNHEUOhGj9ZlmNAW+BMh6QqMZPzxxAx/Jnn
         DCnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=K+WGWnzJYW4S2iI8/mx93AwJbjDQ0v4CrAPEeljIjTg=;
        b=qUmMQxTd91FXq7BU3QjMJY2kOBbtzvRFp6xwSlxIuDnA5rLcfS7nSW9OYXS2WTo8UH
         rThPTqfoi5Txz8B9rCNTDybIDBJyxhNnK9jKhdEnW3VCYHxHMjP8tpHIpXmgFen3rPDi
         U5uvbPBIreHML6/1Th22sNo/Lq1OkAJfIwa4In8S+5IUVtq9hy9g06pBnTLvTATDkvzE
         ipWXCVN9svk6Vgw52h7D0xCLXH5qn9ggjnw8DBMUSiHjiBqw1mtBiMUzXgL3e87XJFhl
         Ak4BDAUP2BEo691EwcQiphBo3w76TnVdy96sl/u5/TeMHUPwocd9elKs+HgdWNpirFMx
         CedQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KJCh7aJK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l23si1020697wme.129.2020.11.03.09.02.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Nov 2020 09:03:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KJCh7aJK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZzhz-00085W-1A
	for alex.bennee@linaro.org; Tue, 03 Nov 2020 12:02:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kZzg6-0005h5-Ec
 for qemu-arm@nongnu.org; Tue, 03 Nov 2020 12:01:02 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:40436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kZzg4-00085B-1H
 for qemu-arm@nongnu.org; Tue, 03 Nov 2020 12:01:01 -0500
Received: by mail-pf1-x443.google.com with SMTP id 72so8050577pfv.7
 for <qemu-arm@nongnu.org>; Tue, 03 Nov 2020 09:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K+WGWnzJYW4S2iI8/mx93AwJbjDQ0v4CrAPEeljIjTg=;
 b=KJCh7aJKI5EnlxloJ4ZPnSMBxccao4rWDqVyxz5LMOoMOiUCo4iSkJ89a2xJC63U75
 EDOwAtgFYdqUMyDoUJmb8OkuevOLyoOrGOsWXfBFZUBoNfY2k4uC7027gHRtGdMhnyf8
 CaBeh+xDH7LxHLVb74apmiACWVBCN28ff1/gtjvtnr9jEIiCWgne4dx/0OhSzeYPq23D
 s89JwzTYIPyAKgXnda4BYgS7Mrv1jSzIwPT9IGgrXf3THR0YOZQcDmJsd5vhl8nkMSZs
 L2l36Vo6KfG7qlDhqCjXIgnNegqKtHzlysZOrh2lwwi56Fjtw2qwWplZcuJNIv5VFRrY
 Cxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K+WGWnzJYW4S2iI8/mx93AwJbjDQ0v4CrAPEeljIjTg=;
 b=JwwYggs2gEN0Wj3Z3wRP+BIKI1uq8Vdxkk05MZ3cue4A2TRXR0LbM9J33UJCgwwUJL
 QqoL2o1zvv+97u5FaRnIT51dDgVbmKce6oBNt9xny41halcS4D+UDRdJI2DIDhLijPxU
 jG1H5Z9dOjUf9lsDQJuWlCy0O0Fni5vIsPjXtvdBUit0zbo0w5uNVyqDyRiU2GLGgfwb
 6HjuOvRE0a/7Ly3Xkd6rIMIs80FewTtpsEed7yBj23o+UwGRXpIeNdzOuiSUIho1rus3
 wYY0rOk8Qe7JiaMONastzof5Gfw+HH/MHAdNDrtz4m+TsVjKUugIEvTK+sldDUxERQOt
 nAZQ==
X-Gm-Message-State: AOAM533TIbR2BkbpomCcs9nZ7K7sufHVUWS9jlAwhlQ9AzC/oANB8F/h
 y4qplMLFL0vylCKoAjnzOLFy1A==
X-Received: by 2002:aa7:84d5:0:b029:18a:ae45:54bc with SMTP id
 x21-20020aa784d50000b029018aae4554bcmr15469760pfn.27.1604422856231; 
 Tue, 03 Nov 2020 09:00:56 -0800 (PST)
Received: from [172.16.1.221] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id j24sm4042568pjn.9.2020.11.03.09.00.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 09:00:52 -0800 (PST)
Subject: Re: [PATCH 04/14] target/arm: factor MDCR_EL2 common handling
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <2172054.ElGaqSPkdT@basile.remlab.net>
 <20201102105802.39332-4-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fe08bf17-ec53-582b-1d3f-bb78b2403691@linaro.org>
Date: Tue, 3 Nov 2020 09:00:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201102105802.39332-4-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oni6k2WXNbnO

On 11/2/20 2:57 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> This adds a common helper to compute the effective value of MDCR_EL2.
> That is the actual value if EL2 is enabled in the current security
> context, or 0 elsewise.
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/helper.c | 38 ++++++++++++++++++++++----------------
>  1 file changed, 22 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
