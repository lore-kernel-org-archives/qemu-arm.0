Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp488954lfy;
        Thu, 13 Aug 2020 05:48:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzgW4Sd5bioV6QluFLyQQpy05dPTSVw8QR4okfgrZtL53Y5zzM4mVx1X6+LomjaGPKHvh9
X-Received: by 2002:a25:cc12:: with SMTP id l18mr6465859ybf.224.1597322935776;
        Thu, 13 Aug 2020 05:48:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597322935; cv=none;
        d=google.com; s=arc-20160816;
        b=zzUltl43Vph01i/yU6zxsXvbG/tKrHDkDJuK355ZOIaPgz6+TYv3Quuc3PLBJylzA4
         M5g1d+qX8CGnDzrGjyA0RRqJgVR8Qzt8847XGzquRcbUvaSa9+I0XIaU89kyLWBhVxSP
         GM5ty0SlXKJvQuyD//P5+kVNKBCawfwgOfyxBI7iP5yvHyncYnOduNB2J8wSbZFaeWeU
         3AQG6iKBJ58glGy2HHbccfegb6foJHSMMDS9rWSLUq/qYpss+r7WAYzgTsKydsWCZiPF
         5/DtI6tOLzmflIl6w3GtteXG1Pg2i6eRxy63yE6cn122Ku9kUI9OGBuRPYpT90fiaWhp
         TWUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=FM9teGpkbxNSp+b8JTltoFqizZyG7vE3Yxbzk2QaEZc=;
        b=JcjojHUNMMuIEVigL2tDTMcJ5BZVm3AYzuLnQXqmQ0CMd/oi4UiONcdG+ST+0UjW46
         g5XunLJgYeNga0YGiYXRaPTrToAcj03WtazDCG962lGnyVXTmcw0nrSMieJD7OZFe86t
         NL4rSNPcVjfKFriITPSFr7wnp7SVV84vPZbmPC701u+/PPZWloXoRBrFKhBxekc6865n
         YTmYCl2GnVakukHFo5u479JP/7ocH1DoOdTr6XZ9rvLeFSOK1xpqvn2PlDRJt3cBXW3E
         cEdFZ5t2vfnYd300VvaRVZI1Qq46kFiYMACxYhRa7ID8wIHJI+9j/7culeXZITpENKmD
         3Fng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OyDdVTtH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d73si5119905ybh.215.2020.08.13.05.48.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Aug 2020 05:48:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OyDdVTtH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6Cf8-0001z9-Qm
	for alex.bennee@linaro.org; Thu, 13 Aug 2020 08:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k6Cex-0001y8-46
 for qemu-arm@nongnu.org; Thu, 13 Aug 2020 08:48:43 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:46972
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k6Ceu-0005pA-0M
 for qemu-arm@nongnu.org; Thu, 13 Aug 2020 08:48:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597322918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FM9teGpkbxNSp+b8JTltoFqizZyG7vE3Yxbzk2QaEZc=;
 b=OyDdVTtHUiqhwPFOyLzk1vLXrRA24cj8nW8o56llUOe6LAemsmKEi7zwb1E9pJSfzXhA/V
 nhnmSe25G92KtKz9ucQtvqbHNKF09xNdhmNWbLciPgbfPV6DHW2LNr1TCAYWsDKCOalj4b
 1U2djTfqS3H9PhB3y2KBfVLg3oXvtIs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-QPXyMACzMY6NryYQxKI6vQ-1; Thu, 13 Aug 2020 08:48:34 -0400
X-MC-Unique: QPXyMACzMY6NryYQxKI6vQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFCF78064C0;
 Thu, 13 Aug 2020 12:48:32 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4B35648BA;
 Thu, 13 Aug 2020 12:48:24 +0000 (UTC)
Date: Thu, 13 Aug 2020 14:48:21 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peng Liang <liangpeng10@huawei.com>
Subject: Re: [RFC 5/9] target/arm: introduce CPU feature dependency mechanism
Message-ID: <20200813124821.psavdkhddg4duar6@kamzik.brq.redhat.com>
References: <20200813102657.2588720-1-liangpeng10@huawei.com>
 <20200813102657.2588720-6-liangpeng10@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200813102657.2588720-6-liangpeng10@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 02:03:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com, mst@redhat.com,
 cohuck@redhat.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G5O8jh6riKHf

On Thu, Aug 13, 2020 at 06:26:53PM +0800, Peng Liang wrote:
> Some CPU features are dependent on other CPU features.  For example,
> ID_AA64PFR0_EL1.FP field and ID_AA64PFR0_EL1.AdvSIMD must have the same
> value, which means FP and ADVSIMD are dependent on each other, FPHP and
> ADVSIMDHP are dependent on each other.
> 
> This commit introduces a mechanism for CPU feature dependency in
> AArch64.  We build a directed graph from the CPU feature dependency
> relationship, each edge from->to means the `to` CPU feature is dependent
> on the `from` CPU feature.  And we will automatically enable/disable CPU
> feature according to the directed graph.
> 
> For example, a, b, and c CPU features are in relationship a->b->c, which
> means c is dependent on b and b is dependent on a.  If c is enabled by
> user, then a and b is enabled automatically.  And if a is disabled by
> user, then b and c is disabled automatically.

And what if a is mutually exclusive with b? I.e. a and b can both be
disabled, but only a or b may be enabled.

Thanks,
drew

