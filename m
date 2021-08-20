Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1042200lfg;
        Fri, 20 Aug 2021 00:23:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyr5QSg48JJ4fXRHb2TlQBn7N+waGCBJVbSqK88dC40j7skkR1zK1MJB3tSyGxS5iMZilii
X-Received: by 2002:a5b:108:: with SMTP id 8mr24253806ybx.174.1629444229634;
        Fri, 20 Aug 2021 00:23:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629444229; cv=none;
        d=google.com; s=arc-20160816;
        b=Rre1c83/Sua1Kxbjfie/+6t9Y+fz/v2ZmKVMcpPSKwZp2jPxXyjvCJFLj6mTTGhyig
         UTm/N9NgsjdKDpzYABRTlHyIZO8aiU7jif3gsHrfAZC3tz3GVgiBQU7jlg5JokRUPDNu
         cyTO6o0CoC0PSAu+b/CcWJsTRzQ008aS29yYWXo0zWKFAKhTQMSHmuOJEF/XufkbFtNs
         OCZWezIvW1vMmhRe2A1os3B3dVo0MzaC+ERogHZjT/p70n6vzMMdzeyAugxw/HElLduu
         JZEtAlTeTA+O9mBiXJGSlj+whyDTnbOYVnTZjOgD7GScTdm++Q6l63hL/IRkkOIcSREe
         stsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=50sGrbJd6XGQVO0HKh6bMdHGz64TX+P+faGhdL6ZRQQ=;
        b=KztVunzIAuREN2JkYOWYgQzAxWRNrC7f1vgyEuBC4G7n3kQNCKKztm3Ztk8MJoaKMt
         Dpm48g+Yxt76Rg/6ErzUn5PneWRYCqg1CWThsqwE3fnK0kpRELB6wAdFsI2SkxgS2Ur6
         7s7TWSEZUHovmcOsVh5XziEF4UqDqGJ4TFuc/n9f073Q57rHy/rBWPqdwIppmcjWN42F
         d0ZseN9NNdJbuSTeO3aszzjErZObwGIhL2v2tpWksQ+tIstbHYwwEeC+oN8Xm2xEVmPH
         rxddISw37I1NHLoL8h2nFjFTzr4robCB4WC+Wzfr/V2Y3LDlN3woIWui/+7Yd9JKJgWb
         9SLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gy8Hvthb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4si4735807ybi.210.2021.08.20.00.23.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Aug 2021 00:23:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gy8Hvthb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGysX-0005X3-0g
	for alex.bennee@linaro.org; Fri, 20 Aug 2021 03:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGysN-0005WJ-GV
 for qemu-arm@nongnu.org; Fri, 20 Aug 2021 03:23:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGysL-0005SI-OA
 for qemu-arm@nongnu.org; Fri, 20 Aug 2021 03:23:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629444217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=50sGrbJd6XGQVO0HKh6bMdHGz64TX+P+faGhdL6ZRQQ=;
 b=gy8HvthbnsaCvYmp9hj5f7gqyJjCLw6XNqHa5JhpQP0HaAafTyp+HkYaBmsGL/UGG9kPZL
 LGUhYmgyr61ZJTKR8FkFwZ9c3+EYIjqIHejEsLaZBIzJ32yRtxBVi77aoXnvdhHbNVIe7Y
 d9FppA+SaBCMrT2x74tyVlwjjCaTrwA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-3yOpuCLyM_quEdsvqTnxJw-1; Fri, 20 Aug 2021 03:23:35 -0400
X-MC-Unique: 3yOpuCLyM_quEdsvqTnxJw-1
Received: by mail-wm1-f72.google.com with SMTP id
 r11-20020a05600c35cb00b002e706077614so1883740wmq.5
 for <qemu-arm@nongnu.org>; Fri, 20 Aug 2021 00:23:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=50sGrbJd6XGQVO0HKh6bMdHGz64TX+P+faGhdL6ZRQQ=;
 b=birr7jquoTcxTZgpziZUgx37BeseQ/fKDB/85QCipH3Jf6G9H8qRUXZ3sLGOe2hsbb
 zCo/6oggfuEv9Ha8OECPXxTap2yJjHxMyzY1BkD0Z40agu6jcoE0De1g8XNft6TNsU41
 W+eTd79MCAdXe0y/Yhq8eFpSubKWZRID59Wm0rrr3JrgQW/jYB1R0FIW109gLvUuDMC9
 hhabyhiVEViYPohlMxGVWxX5/N2ucQJGnZn9Fh13c7/NrXwK70H1JWJQugoZZ4/xcnk8
 Mbsvt3EunxN/MKbsff1EeU5HH+G1mofw9KZNoOMVwlf9hB/QVTvKkhGj1KhE0Dl1TeN3
 ihAw==
X-Gm-Message-State: AOAM531r2ymQLhGweIUV/it8X7QzhpNSq6xcfAHY2BL4XL1rODDV2+QD
 ihDPs3PwHiee237Y/4cCHoKXMw9snM9d58sDCRC37bdKxrKtj/MhnMnoVeFO8R1TzYSt0t/+FY6
 6hYpklU5GYtg5
X-Received: by 2002:a5d:4043:: with SMTP id w3mr1013098wrp.15.1629444214268;
 Fri, 20 Aug 2021 00:23:34 -0700 (PDT)
X-Received: by 2002:a5d:4043:: with SMTP id w3mr1013074wrp.15.1629444214011;
 Fri, 20 Aug 2021 00:23:34 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id k20sm878166wrc.33.2021.08.20.00.23.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 00:23:33 -0700 (PDT)
Subject: Re: [PATCH 3/4] target/arm/cpu64: Replace kvm_supported with
 sve_vq_supported
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20210819193758.149660-1-drjones@redhat.com>
 <20210819193758.149660-4-drjones@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <018e12b5-ac0b-3f13-fc10-9f90191db106@redhat.com>
Date: Fri, 20 Aug 2021 09:23:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210819193758.149660-4-drjones@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 ishii.shuuichir@fujitsu.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UA2Y7BPwx8Xu

On 8/19/21 9:37 PM, Andrew Jones wrote:
> Now that we have an ARMCPU member sve_vq_supported we no longer
> need the local kvm_supported bitmap for KVM's supported vector
> lengths.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/cpu64.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

