Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6074533lff;
        Tue, 10 Dec 2019 08:54:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqxeYjhXfRxAIOc6BojkW35pnaOVneA98tQ6KjKbMSDl8Tz+pi5GA9rlg+R2y7K2tZMh7tvZ
X-Received: by 2002:a9d:1d02:: with SMTP id m2mr24687903otm.45.1575996896671;
        Tue, 10 Dec 2019 08:54:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575996896; cv=none;
        d=google.com; s=arc-20160816;
        b=Y/8i9dBo679XRAvvp+DKXlMlQ3xOEg/40OAhqpkATM40/t4QnUbbMgl5bMbH3+396y
         4CbtD9MMLcjRRCbELmIYIyvnI43ra20TEozdiXfs8YvBzwmVpWn1ikBC1CnMP8dZsiOD
         XiNRubJl0sidT65i5rJl08bOYOhOl+2Eu+e4HJdweDP0vCvvD5+XNASbK+hyIL18ZXHc
         YoWdVBjX6LuRzUnbDlyJmyyq69t3DkrCnuTFvg44gRoGk0HzKv5fpWl/05JRS6TLHe3G
         q8vY8EH01bli0RnoEJA7K5Fz1wa7XUMxJcZXGLzCuSq7GY4l8DbWYBG8I0tLFFXoBB/h
         /Yrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=yBKxW4v01bphY2O9YP1yA6L9FAbeDZs2B/G4JBWdu/E=;
        b=Rh8dHBapT7iiBRPhKwnJodDOYnl5O34nw50lVT9r34Z4GCRG+3VEuKxz2/SsmWwcPz
         X6pObgyqY/T33c8jd8xi1hk+AG8uaO75ZmSUJfImC8f4w/v4v4ueQ8/HIF8ATxS9UTYl
         2osR3AUqCKLg8WXUhZtwx2GjY4xWFeBe04KR4K3rQiMaten1vEe1fwcLpdMslEyMBmk3
         zUvUPG7AyzrphZddIw7PvzjQNZG71i6umprpfUuIPweh8QZtwPoutJDm+1yGjU9TyBrG
         dD4lxUO9YCc7IvFBFi7vRRt9rO2/wF+Zk2IdDfOYJP89ICHG0hJyAR+1uaZ0YBGrtCbg
         +2Mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j5+PyxjG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v18si2028271otn.257.2019.12.10.08.54.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 08:54:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j5+PyxjG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ieiml-0004kM-IE
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 11:54:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59291)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jean-philippe@linaro.org>) id 1ieieR-0004k4-Pq
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:46:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jean-philippe@linaro.org>) id 1ieieQ-000555-Ua
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:46:19 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:46261)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jean-philippe@linaro.org>)
 id 1ieieQ-00054a-Os
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:46:18 -0500
Received: by mail-wr1-x443.google.com with SMTP id z7so20781808wrl.13
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2019 08:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yBKxW4v01bphY2O9YP1yA6L9FAbeDZs2B/G4JBWdu/E=;
 b=j5+PyxjGFHC0Sr3oAnZYMUkLhH3Yjf/rZSjyCb+vUWnHg8tykTdUKDwS7HlIrmy6Sk
 nNXzqKGkeyQz4ujmtDZL+im0k2nQYSoivNp3P0P3qLl8ICw4iYxyKqI5MC4Sv7S5VSam
 Mg91e5Ycs2wgJyiuysUOIHSbewI/6UvG4AN5SvtKGzvyejo3uWy+FptbcGyNll+5XAX2
 XHHAVRIUgfWyTRQZHXfPusugHkAu+UGIVgj4ISzTzgS13M/ZjdCaeHQIcseinzJGbHCS
 e1b18kluJ4WcKH6h0+vJye8COrWjl8ugB6+2WkHO2ehGnrHsFt1j/UIrzaMBdym6fj4B
 yM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yBKxW4v01bphY2O9YP1yA6L9FAbeDZs2B/G4JBWdu/E=;
 b=ML+ktX6qjZBr4IYP+Dlhgnzo/WJMcW6kdNJ+PoKgDcD26KUKtQk5YUNepR5gYDbqPo
 aynKQQf4C9YVIWx/oe7fqNQstQNyqgSg+JzVKrqwyO48mhYjo+EuO1R+XsZ8Zxq4DfaA
 yu9T/Wq51Mp8JwxB6fhhUb9IekWtKuIvU6DiCrChK+zjDHGmHBeiUaBB+V2j8cp0YMu0
 kSH9IP3olFH2+ezdINYPd1c99RMaGF6w6M4RHVnaJJx+elrNoJsYViL/oiNjqXNvImlr
 kRa5txUEY0lX6bnpE6FHqo/wbZe8RBoqe+Sz279hpHcbFy91qFxJFhZ/nDjCUvkeZDOq
 j7WA==
X-Gm-Message-State: APjAAAVqHZEpKc2+xsx7ejBaXz2KYJSopWmSQO0I7XtX898Tz3M57o38
 hgrw8U4sj2vyS6cNPPCtsot2UA==
X-Received: by 2002:adf:fe4d:: with SMTP id m13mr3978876wrs.179.1575996377832; 
 Tue, 10 Dec 2019 08:46:17 -0800 (PST)
Received: from myrica (adsl-84-227-176-239.adslplus.ch. [84.227.176.239])
 by smtp.gmail.com with ESMTPSA id w22sm3534503wmk.34.2019.12.10.08.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 08:46:17 -0800 (PST)
Date: Tue, 10 Dec 2019 17:46:12 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH for-5.0 v11 13/20] virtio-iommu: Implement probe request
Message-ID: <20191210164612.GK277340@myrica>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-14-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191122182943.4656-14-eric.auger@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, kevin.tian@intel.com,
 tnowicki@marvell.com, mst@redhat.com, jean-philippe.brucker@arm.com,
 quintela@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 armbru@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 dgilbert@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7RKl6tJ7EtIS

On Fri, Nov 22, 2019 at 07:29:36PM +0100, Eric Auger wrote:
> This patch implements the PROBE request. At the moment,
> no reserved regions are returned as none are registered
> per device. Only a NONE property is returned.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
