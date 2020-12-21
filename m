Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp4758898lfq;
        Mon, 21 Dec 2020 07:47:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz64wXbPoCQBqWhC+NIw4EEJM5RiAx9qcztgvWFGPhGVEEGgQ9iMxM2dFeq+U+J/mBJwleo
X-Received: by 2002:a25:5844:: with SMTP id m65mr21628265ybb.46.1608565626550;
        Mon, 21 Dec 2020 07:47:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608565626; cv=none;
        d=google.com; s=arc-20160816;
        b=AavgLSqSc2eVlooBSrRGXLEQ9BVz9/X0nbTW8fF0RJ1FRje90h2e4SyAB2SFNWDYzQ
         8vzdux35gWKxU153l7yFsKpWybOvL9zlo/q+z6EzJ8BwicoZtG9pJ/7UEswUyWXYcOxn
         i2Vg28MTCYPRFtoa7SqFzY15HYtUYV+TzDx54lEpBALFK7sqI8fqBCONd8vUkThjY3Om
         Fi+a42b7SrRyCEU3tfSwYuUTxzfmeJpcNWkv+hISY7D6mBfphx1s3VZViosd8dNDlxG9
         +J61cYMo+XYf6+Y2aR7peE1w3FpSTsODx1K4WzdsMhQbjr4JYeNXE7rgeZACcoI2ItZI
         S6Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=IVy8vtxMEo/uIv4yozx0ODaeWjB5p67KIOpQprOfV40=;
        b=0UgVFYL+t8SESE5bdsJWN+Unu0LjRUpNWcXQuMWA680yT+93IfhVZQsoRwE9HuANAc
         0PfsB0JtcV1RLt3Z7zrB1PcUKmhIDwfdDpRvlMG0v5Z1zjyq8KrzAWAdyxWnNwehOm+0
         +ZeS/zXvky5RtcxBBKunX5UXQAQrvlgLNjlHw7byKRvXFzgOEVP5QEwt07LFLUEy4Lz4
         tWyle/w6kKSQ0uyjDmebKibeMWz4AyuxRX3PweIWHaDNc8krWaU9RLMt4Mr7alH04wqi
         WzhAVuF9pBuM07CAC4h9ftxRuFSNBt9xHUIXT+ofOzykU+0VeyyzE84hn/OmHYVtzBhz
         BfOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=f0JHS5Ko;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6si17083766ybo.149.2020.12.21.07.47.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Dec 2020 07:47:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=f0JHS5Ko;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1krNOr-00018h-V1
	for alex.bennee@linaro.org; Mon, 21 Dec 2020 10:47:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1krN7g-0003y3-Bh
 for qemu-arm@nongnu.org; Mon, 21 Dec 2020 10:29:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1krN7d-0005HR-GF
 for qemu-arm@nongnu.org; Mon, 21 Dec 2020 10:29:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608564555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IVy8vtxMEo/uIv4yozx0ODaeWjB5p67KIOpQprOfV40=;
 b=f0JHS5KoiDeSWi4dsqdxpZxrZeXe9le2xXloQwWPA2UJ78uoXO1nxiBaNR8XODG6gX1eaK
 YzD6M1Xq7Urn7whknbw7SBSmYc7mv/ia7Xd4V4YZNxieoRhoV8Y3xGw/GoMTNo+qR0vKu9
 bdvBkvR3vHyD4gVzez2OPKFaPK8XFpU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-JjDx1ubDONK5wRWow3-QAg-1; Mon, 21 Dec 2020 10:29:14 -0500
X-MC-Unique: JjDx1ubDONK5wRWow3-QAg-1
Received: by mail-qt1-f200.google.com with SMTP id f7so7985091qtj.7
 for <qemu-arm@nongnu.org>; Mon, 21 Dec 2020 07:29:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IVy8vtxMEo/uIv4yozx0ODaeWjB5p67KIOpQprOfV40=;
 b=G/CJbU2hfMMDmu2jlfXyh6g3i27DlMaa/MODYcIO+Tn/xFhbxHlL/UHWj360mxfQQs
 LfaWDSDByLLUinZQ221Y84i0jQX8XqCT5IEoJ41O0TvU0O/g/obXZMrE45TA6ij3d1s9
 TMVm4QZRvf/HaNnM242Qpdu7zR8NvLHrYrrR8l6p/ZeHpgTSB2j5NWc0AHjwD/HtyG9x
 OQiMLBptE92RVRxIp2Ep+34MFEUP5dute4yEP6mayYmjvLntELUbIDM1MEMBDWHNBDUb
 LuvmRcJKsK0h13C/mdtyAFX9Zi7faN0AEkxAOl+q13PInvVjlPOZ8ybfgObFvq6Rwe8f
 wPTQ==
X-Gm-Message-State: AOAM530gWf2g6/AeY47AQpVXhOff26QoRtOj+94QEQbr+3QfVDD4H/af
 3ViaL6rn4UYxGlp6nb0kTU93VBu0FbvB/iVt2xlTpJRoig7mdYCHx7jXL01jiwz9MmaTD2eDLOb
 v23mQ7Spo/gHL
X-Received: by 2002:a0c:f107:: with SMTP id i7mr17617830qvl.35.1608564553624; 
 Mon, 21 Dec 2020 07:29:13 -0800 (PST)
X-Received: by 2002:a0c:f107:: with SMTP id i7mr17617807qvl.35.1608564553435; 
 Mon, 21 Dec 2020 07:29:13 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id d72sm10965011qkg.34.2020.12.21.07.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 07:29:12 -0800 (PST)
Date: Mon, 21 Dec 2020 10:29:11 -0500
From: Peter Xu <peterx@redhat.com>
To: Keqian Zhu <zhukeqian1@huawei.com>
Subject: Re: [PATCH] Docs/RCU: Correct sample code of qatomic_rcu_set
Message-ID: <20201221152911.GC6640@xz-x1>
References: <20201221121745.27156-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201221121745.27156-1-zhukeqian1@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OqJAyLAblV3O

On Mon, Dec 21, 2020 at 08:17:45PM +0800, Keqian Zhu wrote:
> Correct sample code to avoid confusing readers.
> 
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

