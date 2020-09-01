Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4925868lfc;
        Tue, 1 Sep 2020 13:44:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynAuJIXToEJrrId4n52R6kN2jmMD6Gk+rmwJxIPwtG+UKKwgrEi977V7SiTcBDudO7wMSX
X-Received: by 2002:a25:ca85:: with SMTP id a127mr4889145ybg.113.1598993073237;
        Tue, 01 Sep 2020 13:44:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598993073; cv=none;
        d=google.com; s=arc-20160816;
        b=ni0AH+xHDGnCQyt0vhNw29RgTOTg1nyC/YNpYtqB2fou2KN2++o96gsX3w0x5tNRBO
         HDg6KYby9kMvD52BkNUSLcy/Su41jX7BB8q2D1BLO98vi2BenpxExvzBCwYjbNOIRNne
         ZinqzqTkc39zT72/zYPAhd4dO7sXOvlXDuxUvsRBos8LQvit269oSsNlzrZpgxEqXdnj
         DZP9kxJ0uFhcHxYe9C9Yvf5+sIaOe1EiGpbn0y0MjJI2C94Q3WUatap3NEfXnnP1T9hp
         QKZwTIaTnMXEf6Fod56N35xSa6lVlTXGuE8IGVLhLJMIVuWcLm2+DXAoCtJhXoz5vVZp
         yAJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=xORFC1as1KQ6Pol7M21VvQKUC3hR2jQ7vAJIcyMNB4E=;
        b=HTe5XEYX9NOZL3vIwUxxSfgGlxT+UPhy9uv+GZRLuY6YRhYo4xeOtAprLJat6LA0R8
         I7SiXzaIp4+IjQobADdv7s8TGZBTT0YwLcoSK6ZYAfHjtenEP1oZ4tBOdGxajBFhzWJE
         vo1NM7SK+cpxpstsjcXXTHdi8npPs+bVKFxNRxV6pg0Wf5b4RNR+2WMLw5McEMivOb18
         6V/e7AGfxp8/UrJracbzFDKndlK90MW7eHBR1RBa36W9zbtj3lH8qTKB6wwZg7cOfSTQ
         w0xMyNJ11SOBO2y7NTjjA/dIm56g4l06WCsFqAEfSwEXnIIJLPbPrI93CsWRLGbfawge
         7WaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=I71GOehf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h36si1563566ybi.132.2020.09.01.13.44.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Sep 2020 13:44:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=I71GOehf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDD8q-0005Wk-LW
	for alex.bennee@linaro.org; Tue, 01 Sep 2020 16:44:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kDD8W-0005Po-LY
 for qemu-arm@nongnu.org; Tue, 01 Sep 2020 16:44:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kDD8U-0006Zw-ME
 for qemu-arm@nongnu.org; Tue, 01 Sep 2020 16:44:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598993047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xORFC1as1KQ6Pol7M21VvQKUC3hR2jQ7vAJIcyMNB4E=;
 b=I71GOehf1oVftny5n7R0vO/pD/teD8UhlrnmNSLgMn+VxP1zFZry+z0M9QX8p4Y+cO3diQ
 JGsNCXj0eEnvsY64n47WkSLdpMNVSLgHKnVUR1LLMxY/w/ka9Tyxx0CXi/12nm/mprjZx5
 HXPpqRp+xSGudYxuqM5a0nGod08qZQM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-vXr6wttlMqOsANRkY_wTHQ-1; Tue, 01 Sep 2020 16:44:05 -0400
X-MC-Unique: vXr6wttlMqOsANRkY_wTHQ-1
Received: by mail-qt1-f199.google.com with SMTP id g10so1956482qtr.19
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2020 13:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xORFC1as1KQ6Pol7M21VvQKUC3hR2jQ7vAJIcyMNB4E=;
 b=YzoeidqmoFm5hW5nlTPhLJs6a4RhZQkNchLEVZhSH7jZ5US3TUpgdljIPfRnaVmFJ8
 2g6Vvn/XDVdNPlk4G0TrMYOcEjcie2nvcYjGEO4LnRzqxNrpOR25zyb7lNFyr3gqVIbU
 UxhSVO6P4bfElVZ7qbhqfVtJNjDWQNrnS5t1WfG1ueIArgxdT8dy1LsxIF2zwUyPTavb
 V+XnmDwWl4vkYbrKCcixkl8BjwT0qhTSwotwtiUZeMHymC9Oh6wDd8fApAfcvpQeNB49
 y4nxK2x+6u0/rAxIbwIcNy2MEtZ+MEOKD1mUfoGvkb9dkNottsr0qOVA27x19DS+ueHe
 B+8g==
X-Gm-Message-State: AOAM533v7stn3qjclLjKCrhkOlTX0IWNFDUZORCFHm6T10kZLuFT3c2Q
 UWz5apKMlDuUV1vd+4r+hpqg5GWNieDE/Xz+wQOpMinjopVEPA5qPNj+0L8bLMkJM/XCzjla/V5
 N7nn0Y9nE9U+E
X-Received: by 2002:a0c:a342:: with SMTP id u60mr3828776qvu.2.1598993045331;
 Tue, 01 Sep 2020 13:44:05 -0700 (PDT)
X-Received: by 2002:a0c:a342:: with SMTP id u60mr3828740qvu.2.1598993045014;
 Tue, 01 Sep 2020 13:44:05 -0700 (PDT)
Received: from xz-x1 (bras-vprn-toroon474qw-lp130-11-70-53-122-15.dsl.bell.ca.
 [70.53.122.15])
 by smtp.gmail.com with ESMTPSA id x49sm3032800qtc.94.2020.09.01.13.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 13:44:04 -0700 (PDT)
Date: Tue, 1 Sep 2020 16:44:02 -0400
From: Peter Xu <peterx@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: Re: [RFC v8 1/5] memory: Rename memory_region_notify_one to
 memory_region_notify_iommu_one
Message-ID: <20200901204402.GC3053@xz-x1>
References: <20200901142608.24481-1-eperezma@redhat.com>
 <20200901142608.24481-2-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200901142608.24481-2-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 16:44:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xiFe2QZbpCNP

On Tue, Sep 01, 2020 at 04:26:04PM +0200, Eugenio Pérez wrote:
> Previous name didn't reflect the iommu operation.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

