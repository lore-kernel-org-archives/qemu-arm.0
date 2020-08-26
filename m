Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp867118lfc;
        Wed, 26 Aug 2020 08:44:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFnHSp4MPsI0GJbS2K+tmvplE6nvn3eyqYsqe92JEU1mwWMprSYOXSPxvX3AdN1+ORcssR
X-Received: by 2002:a25:3855:: with SMTP id f82mr21869453yba.301.1598456680580;
        Wed, 26 Aug 2020 08:44:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598456680; cv=none;
        d=google.com; s=arc-20160816;
        b=WZ49p679nvQbgq9xOkbrt7gX8X/41ShD52UmMSPfg2fyUpyYSjDf/qyf3cpWT/N7zb
         osXmcoW5vr3+Lwd2SwNEcWC4CbijRLTaeIBko/4eIP1DQtyVzxX4PImj3v/q39Oi1D/b
         +32ycB6e2sH+qXQ5AR/pptAdDnyoTLszJbho08CBw3lLBRu5gj1ftNKTxU8agk8Bhs/C
         9vvIbKVWCOpr2imocStITVFb30nccyRiwQRpzM/I/oDkc+lW6W3gsF5bcYWc8S+V/L5w
         COAkzOgnX7LgCgr0RrHmEyo6UILgwy81Vwi+EETlubGEBG+klc0gdXFQWSD18I+y2h+C
         yU0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=U8n3BFjGFZJml+ahlhiogNP+TZYxyMBl8wcxGwtMPs8=;
        b=rGatLDd+Q/X0AxnV8qZ1ifv6V8YaEl0YSRpaUl5DqIghiO1V9DcfGlZcxF3TP1AtSH
         pZOM9WEJZwNqv5JoJIr72UPO3pbSVVzSANNWQdyewFvei0YxhHlVsTSKLg2zuqC2pLC5
         DWlksOYWWH7Qmt0QV72aH/Nt/MJbIWd3FPBZKdCrmrH1OMIYAw65teQ2DH695cjHH6+r
         9KWtGasWwgrY/WY0Gb/MrkmXDz5vOkHVkCjD3yv7YiIbRnJiwj23BtiepWr/ANwJ6WrZ
         XOEUaqIkV8WBNxUbbGC+zoRn4Zg7TIE7s6f8+wCVWEP4QnqWdDoMCJyLRErbzJfY8wWY
         5uIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SEQGCO6S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e8si2544610ybb.202.2020.08.26.08.44.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 08:44:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SEQGCO6S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAxbM-0002K1-0e
	for alex.bennee@linaro.org; Wed, 26 Aug 2020 11:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kAxZB-0000ET-Dd
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 11:42:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kAxZ9-0008OD-Cz
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 11:42:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598456540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U8n3BFjGFZJml+ahlhiogNP+TZYxyMBl8wcxGwtMPs8=;
 b=SEQGCO6S4qqzz/JpI5thFunYPAinbQXZwdwSe5PuLov9qhrXV9Nb5boFEB7VO5DMn4y9oD
 /e5WKTRfL36JvPJuiO5rMfd98WrbKLsS7/anBST2qiZOw02fVbZfEI0wxkVYw9l1cachF1
 cygFw+rXe/dCyKqnQLAW3Q0YHbp2qd4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-hnOkThhmNQaz1Z3Owf8M1A-1; Wed, 26 Aug 2020 11:42:19 -0400
X-MC-Unique: hnOkThhmNQaz1Z3Owf8M1A-1
Received: by mail-qt1-f197.google.com with SMTP id g1so1999524qtc.22
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2020 08:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=U8n3BFjGFZJml+ahlhiogNP+TZYxyMBl8wcxGwtMPs8=;
 b=Vkt1E8K0zODp5w1cgw61DrUdTCBWX/rZ2B2ZMmu0RzLpXX5b1DhyFkFXZ0/7WJF9kG
 /londhFNBGf28Pdhr2eude1NxmmJ11UJ16KL6fOMbyG7AgFYIHxYRD4b4ydDWQPUalUo
 tt6JIlNSRYJT6HyhjgrAL0L5xOjxXH8nji/1J654fuESPcCLu9MC20+uqSph4zH+8dYq
 jSAn5OOhNMLr1todyAlHDeuZ0golE0Cfsfigb654L/h6j68RVPDqft3PO2UOe1ZHTsJh
 tgEnDT8gKEaJhOBS9TK1/20CpnOxfoevFix/8zK9zjEb3k86K81Q8zqiHePNJfYNUMhP
 yjgQ==
X-Gm-Message-State: AOAM533iEIkFGBs2p+gLw0WXWA0GnLIHLpp9CWOCax4vbu5L+uEz14gE
 hffwTfMPg2ElHyMuWuMg3UvaLboTEEt/Hok3liMpIqK5o5uE6HCY8onoGEf5qTk3gJG0RUwfeh7
 OzlmleN84K7j6
X-Received: by 2002:a37:af06:: with SMTP id y6mr14480835qke.356.1598456538767; 
 Wed, 26 Aug 2020 08:42:18 -0700 (PDT)
X-Received: by 2002:a37:af06:: with SMTP id y6mr14480818qke.356.1598456538468; 
 Wed, 26 Aug 2020 08:42:18 -0700 (PDT)
Received: from xz-x1 (bras-vprn-toroon474qw-lp130-11-70-53-122-15.dsl.bell.ca.
 [70.53.122.15])
 by smtp.gmail.com with ESMTPSA id i14sm2208861qtq.33.2020.08.26.08.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 08:42:17 -0700 (PDT)
Date: Wed, 26 Aug 2020 11:42:15 -0400
From: Peter Xu <peterx@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: Re: [RFC v6 02/13] memory: Add IOMMUTLBNotificationType to
 IOMMUTLBEntry
Message-ID: <20200826154215.GE8235@xz-x1>
References: <20200625191651.5817-1-eperezma@redhat.com>
 <20200826143651.7915-1-eperezma@redhat.com>
 <20200826143651.7915-3-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200826143651.7915-3-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 06:53:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7kCKVkvKBBnF

On Wed, Aug 26, 2020 at 04:36:40PM +0200, Eugenio Pérez wrote:
> This way we can tell between MAPs and UNMAP, and potentially avoid to
> send them to a notifier that does not require them.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>  include/exec/memory.h | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 22c5f564d1..f6d91c54aa 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -59,6 +59,12 @@ struct ReservedRegion {
>  
>  typedef struct IOMMUTLBEntry IOMMUTLBEntry;
>  
> +typedef enum {
> +    IOMMU_IOTLB_NONE  = 0,
> +    IOMMU_IOTLB_UNMAP = 1,
> +    IOMMU_IOTLB_MAP   = 2,
> +} IOMMUTLBNotificationType;

Can we directly use IOMMUNotifierFlag as the type rather than introducing a
similar enumeration?  Thanks,

-- 
Peter Xu

