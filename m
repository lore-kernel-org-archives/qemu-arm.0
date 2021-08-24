Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2623498lfg;
        Tue, 24 Aug 2021 02:09:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkMDNIw+mC9noW/rXwDOFqc5K/MfKsAovhviWi3Aw8NrSTe9Kao8seOiTwQGREwA/QQBhY
X-Received: by 2002:a25:44d5:: with SMTP id r204mr49469907yba.229.1629796191669;
        Tue, 24 Aug 2021 02:09:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629796191; cv=none;
        d=google.com; s=arc-20160816;
        b=XMWggMfsp82vXd/adzwkTsLeY6mLaO6oRnczEo4gZ1NuBW9ubb23w+j5GEdjRjp3aC
         DrGuPQxMaxUOc3EDR49A07Tnjd6aZZYtGJ5QDPnJhpHCCNim2MSRLvHHHUcYgD156ytc
         3YIg6Kh5HLQmvk2lHa2taBJvCQ8vhROg2thP4/pYHsYkLLg9MkfXo00EocIEfAcvAveT
         60E/EwaXjAYUlk7hQef5kCg20MgmBibzUn4nNcfXC+KEEgdbuiNb1C1LLzFnU5xaoBtG
         ac/FLKqwwQmiB3bfpJaQi/1bSvAFZpHC9SvLy1u6J1XFe7od7LyQJUYTK9WtbxEgHT3T
         x2LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date;
        bh=v0RJLaoKC8EcNuryL8wJ4T4iuGgPQRYZdW3An/xQ0Bw=;
        b=N7o0+/M6NWyI37avs0cfA9sMiTWmDNDbpda8/oYUey1B8XsDWPHdE++jd9vP6EghTV
         3kl+xDXpjxb+KJo2InK0se68Rq5kfAzpFMyW4fBbz5rJ3eUTG0sZNb/OUwy+caIrpcl/
         CkyJwduBR+q5Oo7uRprYyMA5vCxVLCqwQtUfNc3WcYOuQklzI6/QLA29pUU7ozitJuUh
         6lLb0w2a3QSWVLmrxzGtnUUdhthu89FnkmxSDEgA3q+4WaJ13gTlicVNi7yLqiEb4rdi
         kIBUy/wOMU0Qsa0O+VmFkCiVECfENowB3C6/qG7Hknj3KadH5mhuCXA8I5Eqiajs86oy
         sT7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bu.edu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l18si1868514ybk.206.2021.08.24.02.09.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Aug 2021 02:09:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bu.edu
Received: from localhost ([::1]:37374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mISRL-0004Bm-1k
	for alex.bennee@linaro.org; Tue, 24 Aug 2021 05:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1mISML-0003nw-Tg; Tue, 24 Aug 2021 05:04:41 -0400
Received: from relay68.bu.edu ([128.197.228.73]:40262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1mISMJ-0006l8-O4; Tue, 24 Aug 2021 05:04:41 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 17O93gj5007233
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 24 Aug 2021 05:03:46 -0400
Date: Tue, 24 Aug 2021 05:03:42 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH v2 1/5] softmmu/physmem: Simplify flatview_write and
 address_space_access_valid
Message-ID: <20210824090302.hc6hx24lyezlvqtk@mozz.bu.edu>
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-2-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210823164157.751807-2-philmd@redhat.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.885,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lxUPKelUSD7j

On 210823 1841, Philippe Mathieu-Daudé wrote:
> Remove unuseful local 'result' variables.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  softmmu/physmem.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

