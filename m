Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1483597ejc;
        Fri, 11 Aug 2023 09:18:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4qK1edKA8ltcsT5Y053Q9TSKteVjlj1TtcGpx21aYaqqBBjZJ/5MjOVYAGoUGNQqb1Hc6
X-Received: by 2002:a05:622a:1054:b0:3ff:407e:12 with SMTP id f20-20020a05622a105400b003ff407e0012mr3221800qte.25.1691770713937;
        Fri, 11 Aug 2023 09:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691770713; cv=none;
        d=google.com; s=arc-20160816;
        b=XTfE6Z1ECpiZDQ/OqK8nOi9c5ITtTpI6P4FcK8vUx4CDjXVpf98Adf71Xo6nrQMTLe
         Q8RZn8i8IvdJaK7WxeVlZkTTDbuPZdy/JAysgXR2iyTMooj49jFBAzUZOGA+Vo9qXeov
         XeRFR6G2tNcAHBpZr1Ur9Zg/wQS7sN9ik7DLIbC1mErK6S56eWoSJN7lzNsde9yNphDC
         aYqdf651P+5aUrv246/YBnye7BSeIbV98GR/WuZdRaZn4LsxooWFWHD0nQOuFWG5xPUL
         xg8x+GOoUj7j8kfaUS08xYGidGuJk1FLkdKUdsBCVEzP1OCPeETpI1bKXLoDF5dEMVId
         0RUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=wDyi34CPiY9sRWLlpPZ1XFJfj8vpMoJLeBIuoJ5wE/0=;
        fh=AkMSRTXp5HbX1Y73UU7uRL15H6j2WMat8+tJQzSfqMY=;
        b=V9BDo2YkZT67vCmDnq3FyP65tuBP2G4YYG6hcyOOqlrigxV7Ch/lTG54QOU5sn+7+E
         fgWdHuT9vG9CK1RRGZv8EB2pyel5PzzlWX/XIqS7uvjK1pujtia8uhv8WpqbsjcoHru9
         yI7o0PAUDsSkdV65+nnTNY78wAUD5zd9Swov+tSKFv3pAXUCoR1O74qcx69JqFAlpqUX
         vgm7u9wLQqjYF5zpGjs9/GZV8LFejCpfVvdCjeY5GyBaFaqvH8KHvU3tmbaiJdLsj4aR
         IjQ98i/5u2dWbD5YAqOaXx5kRItKuYKVHV03wjOgT9qx5k4WDknlSxn+symA6Izu00Ky
         PeCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TePZUnaw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c17-20020ac85a91000000b00403a91c9c5dsi2414741qtc.525.2023.08.11.09.18.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Aug 2023 09:18:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TePZUnaw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qUUq5-0001AE-Mr; Fri, 11 Aug 2023 12:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qUUq4-00019Y-Fv
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 12:18:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qUUq2-0002uc-Vp
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 12:18:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691770690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wDyi34CPiY9sRWLlpPZ1XFJfj8vpMoJLeBIuoJ5wE/0=;
 b=TePZUnawkO2UzKH6CKMZ7d20dbzQgcG/lAea9pzzMbVe2ARSGudWLZaS8Lx4JS9Dl1Ebjs
 DQW2RgV57E/m5tavq8ivj9daVxTluU/OValz3ByGFqx49hxO/FIlHIY+o1fwmf0fIKpgLI
 lbOjS67Q5ZgjEqErfBmbN4qHxDjoyoA=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-JmROdmlFMRqcVKAWarj3VA-1; Fri, 11 Aug 2023 12:18:08 -0400
X-MC-Unique: JmROdmlFMRqcVKAWarj3VA-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b9ce397ef1so23373991fa.1
 for <qemu-arm@nongnu.org>; Fri, 11 Aug 2023 09:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691770687; x=1692375487;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wDyi34CPiY9sRWLlpPZ1XFJfj8vpMoJLeBIuoJ5wE/0=;
 b=fi9/EnfF1o74jsqzJkVSwcH8AHXNL94yPejC+iua4DXZiW8Fz7D9IZum/odJfyun5g
 FhtNjCj8i1Mz9mSUKWkeaJE46oA2NlexY+X90ALp2dahXCiWuUpqzkKgoxRS1NxjRnt/
 36pKQU0M/q4KS5ELJTyRdLAOw2GjTtt/g9VWMxmBNK/C4DmD1BY2yUac1dZrMMcNkoeM
 yLocv47tZO5Q/FH5wppkfLwkQMPQmZORhKbU69m3JsnEKi9EPexAZKIIZFO0kHYCC8u2
 9rgoHU206pihd6ZXIuanp179r42kvy3Det3TpqoYVEdJU3zfJ90DNeQBc9CI0I23ZA7Q
 lkrg==
X-Gm-Message-State: AOJu0YxlfJsY/4kscncNNAkIslhoethabKpwYsM/zrG98Hd6UUY33qpC
 Siq4KnUe/PGk7U+GUv+KlIauD3sc7UGVu7QyyiAxZU7U5vB0jRkZEfFCZwsT1IbHayxCDZRDtAD
 DMAl+V6k7EkHx
X-Received: by 2002:a05:6512:3695:b0:4fe:2efa:b847 with SMTP id
 d21-20020a056512369500b004fe2efab847mr1603955lfs.23.1691770687163; 
 Fri, 11 Aug 2023 09:18:07 -0700 (PDT)
X-Received: by 2002:a05:6512:3695:b0:4fe:2efa:b847 with SMTP id
 d21-20020a056512369500b004fe2efab847mr1603937lfs.23.1691770686741; 
 Fri, 11 Aug 2023 09:18:06 -0700 (PDT)
Received: from redhat.com ([2.55.42.146]) by smtp.gmail.com with ESMTPSA id
 ce11-20020a170906b24b00b0097073f1ed84sm2419803ejb.4.2023.08.11.09.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Aug 2023 09:18:06 -0700 (PDT)
Date: Fri, 11 Aug 2023 12:18:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jason Chien <jason.chien@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Jason Wang <jasowang@redhat.com>, Chien@redhat.com, &lt@redhat.com,
 Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org
Subject: [PULL 1/2] hw/pci-host: Allow extended config space access for
 Designware PCIe host
Message-ID: <3d449bc6030904ead784a4e4644c9640c2152796.1691770630.git.mst@redhat.com>
References: <cover.1691770630.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1691770630.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YKv9Xe4r1KBh

From: Jason Chien <jason.chien@sifive.com>

In pcie_bus_realize(), a root bus is realized as a PCIe bus and a non-root
bus is realized as a PCIe bus if its parent bus is a PCIe bus. However,
the child bus "dw-pcie" is realized before the parent bus "pcie" which is
the root PCIe bus. Thus, the extended configuration space is not accessible
on "dw-pcie". The issue can be resolved by adding the
PCI_BUS_EXTENDED_CONFIG_SPACE flag to "pcie" before "dw-pcie" is realized.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
Message-Id: <20230809102257.25121-1-jason.chien@sifive.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Signed-off-by: Jason Chien &lt;<a href="mailto:jason.chien@sifive.com" target="_blank">jason.chien@sifive.com</a>&gt;<br>
---
 hw/pci-host/designware.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index 9e183caa48..388d252ee2 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -694,6 +694,7 @@ static void designware_pcie_host_realize(DeviceState *dev, Error **errp)
                                      &s->pci.io,
                                      0, 4,
                                      TYPE_PCIE_BUS);
+    pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
 
     memory_region_init(&s->pci.address_space_root,
                        OBJECT(s),
-- 
MST

