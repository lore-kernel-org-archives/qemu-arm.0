Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp747727lfp;
        Tue, 14 Sep 2021 07:40:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/mi/ZFt+HN6wGJWygj2PqvgXQOLfhIe/tK0bHNvd4B3Sw8jsKN7LxOHQwcCCD/PfcBFi+
X-Received: by 2002:a17:906:1146:: with SMTP id i6mr19651672eja.12.1631630406843;
        Tue, 14 Sep 2021 07:40:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631630406; cv=none;
        d=google.com; s=arc-20160816;
        b=L7rht5s7qr8EGyt3TlnjOOq+QtIGmwuBjCHVjqc5sy4kXqZSJ/eIJ7z0Q7cXm0mwm5
         5U7URNWDBe5D04cXIFxTpdoNkVx5aVY49CFK9CIPb4b63/puw4ipePj1WO5BNDJhsTvM
         ZS/XlBCDEg6Jpur0K9KaV5pn9JzhnSnQ8ecu3vQTJGxScMy8JVbKxH7thAIJreLSRszb
         3EkNGOvfUc31mKqz4De4OcVV8K5SrufeuYDFfOnGGCl4JyyjmsgR9Gol9HVGxAf78qmR
         uGyjhiCxVxL6712+HgjV/IAzLvJ9UX387RHdhDTw7mes1w/JL7i0eukGRcNH0mwZl73a
         zQxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wKfJjTFn5vxla8NE6T/sxv12ovVS50vMdtG+woUrZAU=;
        b=PAZMye+6ZDZsPYdFbHoJQXExkzPGBb9oAE2FyPNzzZB0K2RGdjLBla45NZVD+UzKI8
         sxZKeooC4WR1SkVPHlEvWhsm1SkkLtfcB9JZHxadcYmBKiBJX3eHxDRcOoh2L+PBwIEL
         jpo6f+7NEc57T8it6Ycwq/Fc+Deb6WQXi/qicdAz36D3ABIa4Gpdu4VMPJzoQ7vGuO7r
         G2FmlVj+GyYwz0CNKnYDvcyB1BXmMfBfXpwGei0tGNqgfJc8G4IC58TZphPpVZ0GOwf2
         edsQjt0P0a9zzGbvz8JaX0HZuAM6kTp4JZCHbyLyCrHcrd+qhlpkSooVpe6dy4cceW+H
         WIWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oEMPbWZx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 18si14580872ejc.508.2021.09.14.07.40.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 07:40:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oEMPbWZx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQ9bR-0004he-OS
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 10:40:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MX-0006Fp-Ph
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 10:24:45 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:38713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MP-0005St-BY
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 10:24:41 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 k5-20020a05600c1c8500b002f76c42214bso2255680wms.3
 for <qemu-arm@nongnu.org>; Tue, 14 Sep 2021 07:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wKfJjTFn5vxla8NE6T/sxv12ovVS50vMdtG+woUrZAU=;
 b=oEMPbWZx6dlrcCMtEsEXw/61KeMil2j6OgmuGqXws4wJngU6rJZ5Gos8/0UXrBl4vb
 5+IyMgoAXckKl6yh1B8qWssYSPs2Y4N+g9cAizJ+CKQMZh2olCZlfDY8h92ys7QheteV
 cYJy8o7ZJEDy4eh3Udv0D/wC/OPUo3vFD7zWxtY7YR1aWk4+G8zzVxRmASyk+fr03jGe
 zkMQTV8D5UBly4zxTL+LwQzJjFZW2nmu2hzfLqRn4PhEDllsAYrRnW5HS7k1TeoOCpf+
 4JvF0Mp9jmJJ3LUjOwc9uiFVEtNwO6DMfSF4NyLBLUNbGdX89hgx+QRz0qaQbgAOTk8r
 CObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wKfJjTFn5vxla8NE6T/sxv12ovVS50vMdtG+woUrZAU=;
 b=yqUjbcwA3BKO1nq6jnS/XJuCnS70LvdRVaXZypGX6v0mnueoaV26VmYME2VtL452QH
 53lnCGA2WVv36G/wzB4EmVKwSuQS8fUWsrzUzcr4qdBcpgtx5/XjxgG+YKHJ0d8QCQjt
 pu9MJqRBHpL6BFmC2Obp0ZMhbDCgDjoU8i3Z/1xoOi2zN5CXCVp9TS4IylwsTS10EDrR
 NH3KwIidLCV37lS4O4cUjzdcaI11KPIihmHbhHJUi578ND2ajY505ZxyECNd/+w6mhrK
 N/eVcWiGLyHAtcVXXU9OYiwBX+3HxGm0PEARu3ATU51BI6I9lDW9A4Goj3raw45R8jfm
 6Jdw==
X-Gm-Message-State: AOAM5339OISzk5mDNhgcl9AyugJG7Z/XFSz+fKD4TNYjAJ8atT9hVQRK
 hgNzyghT+R7fvuYgmwi+Cre8ww==
X-Received: by 2002:a05:600c:2e43:: with SMTP id
 q3mr2513571wmf.119.1631629470720; 
 Tue, 14 Sep 2021 07:24:30 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k6sm184252wmo.37.2021.09.14.07.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 07:24:30 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v3 09/10] tests/acpi: add expected DSDT blob for VIOT test on
 q35
Date: Tue, 14 Sep 2021 15:20:04 +0100
Message-Id: <20210914142004.2433568-10-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914142004.2433568-1-jean-philippe@linaro.org>
References: <20210914142004.2433568-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rWsnXsOC3HWA

The VIOT test instantiates two virtio devices and PCIe expander bridges,
so the DSDT has additional blocks:

+    Scope (\_SB)
+    {
+        Device (PC30)
+        {
+            Name (_UID, 0x30)  // _UID: Unique ID
+            Name (_BBN, 0x30)  // _BBN: BIOS Bus Number
+            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
+            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
+            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
+            {
+                CreateDWordField (Arg3, Zero, CDW1)
+                If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
+                {
+                    CreateDWordField (Arg3, 0x04, CDW2)
+                    CreateDWordField (Arg3, 0x08, CDW3)
+                    Local0 = CDW3 /* \_SB_.PC30._OSC.CDW3 */
+                    Local0 &= 0x1F
+                    If ((Arg1 != One))
+                    {
+                        CDW1 |= 0x08
+                    }
+
+                    If ((CDW3 != Local0))
+                    {
+                        CDW1 |= 0x10
+                    }
+
+                    CDW3 = Local0
+                }
+                Else
+                {
+                    CDW1 |= 0x04
+                }
+
+                Return (Arg3)
+            }
+
+            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
+            {
+                Local0 = Package (0x80){}
+                Local1 = Zero
+                While ((Local1 < 0x80))
+                {
+                    Local2 = (Local1 >> 0x02)
+                    Local3 = ((Local1 + Local2) & 0x03)
+                    If ((Local3 == Zero))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKD,
+                                Zero
+                            }
+                    }
+
+                    If ((Local3 == One))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKA,
+                                Zero
+                            }
+                    }
+
+                    If ((Local3 == 0x02))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKB,
+                                Zero
+                            }
+                    }
+
+                    If ((Local3 == 0x03))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKC,
+                                Zero
+                            }
+                    }
+
+                    Local4 [Zero] = ((Local2 << 0x10) | 0xFFFF)
+                    Local4 [One] = (Local1 & 0x03)
+                    Local0 [Local1] = Local4
+                    Local1++
+                }
+
+                Return (Local0)
+            }
+
+            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+            {
+                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
+                    0x0000,             // Granularity
+                    0x0030,             // Range Minimum
+                    0x0030,             // Range Maximum
+                    0x0000,             // Translation Offset
+                    0x0001,             // Length
+                    ,, )
+            })
+        }
+    }
+
+    Scope (\_SB)
+    {
+        Device (PC20)
+        {
+            Name (_UID, 0x20)  // _UID: Unique ID
+            Name (_BBN, 0x20)  // _BBN: BIOS Bus Number
+            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
+            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
+            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
+            {
+                CreateDWordField (Arg3, Zero, CDW1)
+                If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
+                {
+                    CreateDWordField (Arg3, 0x04, CDW2)
+                    CreateDWordField (Arg3, 0x08, CDW3)
+                    Local0 = CDW3 /* \_SB_.PC20._OSC.CDW3 */
+                    Local0 &= 0x1F
+                    If ((Arg1 != One))
+                    {
+                        CDW1 |= 0x08
+                    }
+
+                    If ((CDW3 != Local0))
+                    {
+                        CDW1 |= 0x10
+                    }
+
+                    CDW3 = Local0
+                }
+                Else
+                {
+                    CDW1 |= 0x04
+                }
+
+                Return (Arg3)
+            }
+
+            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
+            {
+                Local0 = Package (0x80){}
+                Local1 = Zero
+                While ((Local1 < 0x80))
+                {
+                    Local2 = (Local1 >> 0x02)
+                    Local3 = ((Local1 + Local2) & 0x03)
+                    If ((Local3 == Zero))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKD,
+                                Zero
+                            }
+                    }
+
+                    If ((Local3 == One))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKA,
+                                Zero
+                            }
+                    }
+
+                    If ((Local3 == 0x02))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKB,
+                                Zero
+                            }
+                    }
+
+                    If ((Local3 == 0x03))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKC,
+                                Zero
+                            }
+                    }
+
+                    Local4 [Zero] = ((Local2 << 0x10) | 0xFFFF)
+                    Local4 [One] = (Local1 & 0x03)
+                    Local0 [Local1] = Local4
+                    Local1++
+                }
+
+                Return (Local0)
+            }
+
+            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+            {
+                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
+                    0x0000,             // Granularity
+                    0x0020,             // Range Minimum
+                    0x0020,             // Range Maximum
+                    0x0000,             // Translation Offset
+                    0x0001,             // Length
+                    ,, )
+            })
+        }
+    }
+
+    Scope (\_SB)
+    {
+        Device (PC10)
+        {
+            Name (_UID, 0x10)  // _UID: Unique ID
+            Name (_BBN, 0x10)  // _BBN: BIOS Bus Number
+            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
+            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
+            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
+            {
+                CreateDWordField (Arg3, Zero, CDW1)
+                If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
+                {
+                    CreateDWordField (Arg3, 0x04, CDW2)
+                    CreateDWordField (Arg3, 0x08, CDW3)
+                    Local0 = CDW3 /* \_SB_.PC10._OSC.CDW3 */
+                    Local0 &= 0x1F
+                    If ((Arg1 != One))
+                    {
+                        CDW1 |= 0x08
+                    }
+
+                    If ((CDW3 != Local0))
+                    {
+                        CDW1 |= 0x10
+                    }
+
+                    CDW3 = Local0
+                }
+                Else
+                {
+                    CDW1 |= 0x04
+                }
+
+                Return (Arg3)
+            }
+
+            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
+            {
+                Local0 = Package (0x80){}
+                Local1 = Zero
+                While ((Local1 < 0x80))
+                {
+                    Local2 = (Local1 >> 0x02)
+                    Local3 = ((Local1 + Local2) & 0x03)
+                    If ((Local3 == Zero))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKD,
+                                Zero
+                            }
+                    }
+
+                    If ((Local3 == One))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKA,
+                                Zero
+                            }
+                    }
+
+                    If ((Local3 == 0x02))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKB,
+                                Zero
+                            }
+                    }
+
+                    If ((Local3 == 0x03))
+                    {
+                        Local4 = Package (0x04)
+                            {
+                                Zero,
+                                Zero,
+                                LNKC,
+                                Zero
+                            }
+                    }
+
+                    Local4 [Zero] = ((Local2 << 0x10) | 0xFFFF)
+                    Local4 [One] = (Local1 & 0x03)
+                    Local0 [Local1] = Local4
+                    Local1++
+                }
+
+                Return (Local0)
+            }
+
+            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+            {
+                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
+                    0x0000,             // Granularity
+                    0x0010,             // Range Minimum
+                    0x0010,             // Range Maximum
+                    0x0000,             // Translation Offset
+                    0x0001,             // Length
+                    ,, )
+            })
+        }
+    }
+
     Scope (\_SB.PCI0)
     {
         Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
         {
             WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                 0x0000,             // Granularity
                 0x0000,             // Range Minimum
-                0x00FF,             // Range Maximum
+                0x000F,             // Range Maximum
                 0x0000,             // Translation Offset
-                0x0100,             // Length
+                0x0010,             // Length
                 ,, )
[...]
+            Device (S10)
+            {
+                Name (_ADR, 0x00020000)  // _ADR: Address
+            }
+
+            Device (S18)
+            {
+                Name (_ADR, 0x00030000)  // _ADR: Address
+            }
+
+            Device (S20)
+            {
+                Name (_ADR, 0x00040000)  // _ADR: Address
+            }
+
+            Device (S28)
+            {
+                Name (_ADR, 0x00050000)  // _ADR: Address
+            }
+
+            Device (S30)
+            {
+                Name (_ADR, 0x00060000)  // _ADR: Address
+            }
+
             Method (PCNT, 0, NotSerialized)
             {
             }
         }
     }
 }

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/q35/DSDT.viot               | Bin 0 -> 9415 bytes
 2 files changed, 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index fa213e4738..27ab8d3ba8 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT.viot",
 "tests/data/acpi/q35/VIOT.viot",
diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..8308c1e4ea7751a7389fcf7b91eda15168bf1460 100644
GIT binary patch
literal 9415
zcmeHNO>7&-8J*>ymdlm2q$taOi3lg@UxI{^^4As(Lhe!|Es>%~Do#KHTuMqSJ1MeA
zVjzxTKvsan@u6tKI_QxO6ri{E)N2DYKvAFv9||-;Pd)UKYf;3fsPCKEk!DB=h)%sk
z0(SSCeQ&;bvpf5Sv+K3I_Fo=l%y^=>=2lv{;>!&;hd+ZcM#r>ws<F$gv+EVhT_Y8V
z8J$}xevD1g%s$~2H_FCucl=L$|LqTaqZhEvPo2A)z2Lpu{w5>Pwavh?=)fsWbz8-5
zXV0}7ZZ&UqD^<@f+_y}#>x!eO*)4cYW_CBK9?Pyybk|yL?9OY<^)4+8>hb<gdd6}(
zwSO*sJ%9eiPcFS(`21)8`1zgJtQY``*qhid1+?*R_}08Xa6ax|F>Vr_pIaEreB9@!
zMVUiq0-s9m*`kQ5TG)TBv-iB$EV#UllZ|>K@8%cKF1OiA&s*m|m}AVQ&Y{0Q92^|{
zNgOigI&*5KP+2l7jZ#~xG@y-Cb#^O_c8%GL-Tx-VVx3zK#WOFJ>RztV^t!q1v)xv^
zzyd1q11jph>syXLus`bitna4|4))n#>Z5*-{ibKLfBiSU&-Sfp(YCZT^?s7ta{n6^
zV+^hN-jmcC>hI3p*=noM<z0;Q^Jq$=+FXxVzGXWr(@#YukWihyr&o#|z~UN3(R#E>
zra5iRmJOfz%rMHvHrvMjLIl}5dym%EHV#?SGaAdZ;uolgI(v(&jrM}9J0`BTp<x|s
zvTVE)eJ5&~7j}8gi|$(OkP`<Qy*Y;SAo?K6%nJ_ZJl1TxhpkD4*N;~nuz(rn1!ka&
z>gl6C+HJV4wvqb6woF_a3S9KvMh+V<*V%2AE@Bk?&9-piQWUtweCZ-i6zjF7k@~x!
zQQ#Kq8?{`c>b;!n7{yh0g=HUWxTTAc&Lb2Z90WUr2(BAf7}e4FJ{9k??BfM+#-XUL
zfHr=J^|M~0;k9a0gVk_o+<)$`|870=ZtbJFuWD!h?A8LR>-AsygGc&T+2Bn7iWR{K
zxXJG$8@KHN+fPT0TeM;K<_5F<tJXx2iAUHZ>jnPp9%K7Gvr%=IS=R1iZv;COIlp?v
zpqs^Uzv2VA(QG#|D{t*)QZd|}Y_+~pV&d4q@iNQURBlBOlw}Y_P+^(L7}|l6ByeFw
zEC8p(InD!AhQvhu92?<GV8e)*5*lHg2`FbGBqmzJu~E*HEr>E=N@!Ft0p(1D#FSYu
zt^}6X6XQ$?jR~e~JVI4xT+<onObLw(rffVyRcAuencz$bP3SrisyZh$ofDeQ30)^b
zRi~-xG&P;3t`niE6Hg$er<0n_q^=X8s?*YRTAEHv*NITonbLHoG@U73Cqh*xo`uTw
zv^AZ!t`niEb5heesp*{5bs|)CPH8%)G@VnrPK2t?X-(&}rgK`?iBQ$)XgVEDr=#mc
zsOn5>I@6lYw5}7OsxzbM%xF3@x=w_u&KXVTjHYu&*NITonbmY=HJw>qCqh-{tfq5T
z(>bf_M5yXKrRhAS={%+DM5yY-OagbGd=AZNI_Gqq2vwb@HJzt5ou_r32vwbDII|Ew
z3D0n5F?`sa5lr_eB&HW)&uYxG8uP5qM5r>)Y0PsP^PJ8^s4~xM%<~%ayv{_ZG9S{I
z4{6MYbS6TT`7mcnmwA{o<um?a!ITefgv69ra9+zfujQQAb0QQuO&DlFG0<|Wiqzap
z4ICqJXrKs?Rs>N5GARsH;J76jj99XL29gTsp@AZl(qNzhD-BeEl7R~7p@AYqYovh+
zY#32a)j$RG&_EHQMH~wQ71%HeHF78!sDR2))d>R?)p8~bRDqI#B9yL328vMXgn<ey
zXTm@gC>f}L@|<L#2&GOKsK9b23{-)VfeI*Rl7S+WI$@v!%b74x1xf}gpqxnticnrp
z7^uK<CJa=8l7R{+XOe*;lsaLc0?U~&Pz6c`DxjQ628vMXgn<eyXTm@gC>f}LawZul
zLa7r5DzKah16818paRO7WS|J8P8g`bawZH^fs%m=C})y^B9uB|paRR8Fi-_b1}dPO
zNd}5g>V$y`EN8+%6(|{~fN~}oC_<?d1}d<e2?JH2WS|1dnPi{{rA`>Az;Y%GRDqI#
z3Mglifg+STVW0xbnJ`cVN(L&RoJj_XQ0jz%3M^;BKouw%sDN@N87M-j69y`<oCyO}
zpk$x|%9&)K2&GOKsK9b23{-)VfeI*Rl7S+WI$@v!%b74x1xf}gpqxnticso=feI{V
z!ax-$8K{7ACK)I~sS^e&u$&14RiI>`0?L_Wpa`W-7$_peKoO}1icmFBgo=SGOc<!b
zBm-5LWS|NY2C6V&pbC==RAG{VDohxt!i0e;Ofpb~Nd~GgVW0{V2C6X0Kouq#sKSJS
zB9d1Z28sw*jCUp(C_-EY84^?WEesTq>{}QpBH6cOpa^B(l7S+`QqkEiER+rGKL4@0
zPd`ZSC1_XZ-1^B=QTmlis~WW4VKkcS1vu_{kv1-EJd<JVWxYhl%d{!erebDis_R${
z7$k34yE|B9N$y*z?9<hCx0wW>nNLqysSgt@$yb7|vpZB~#j&jhH+HOPMn`Bw6H70v
z6PP0u<dTPt<r-QHGSTc-`jj>E;S@_o;cg7iZ-yr^Rxh&Cd>v??nt;|6vgxi@ZLynl
zZ0+)rX<CnBK)6jF&vjePmT_k%Yy+jI@-TaGC_5HUzIFDZlD){Y7tua7doepcd$F@u
zBkf`-4a<F@b}Mp%^sbWL<>}p_^zJd~-7vj3B;LY;*0)ygDd|0)-Wy8q9h2S*)0c+R
z$4-#Gq@*wL^rfNnrDM{U!t~3->EkCzzpSKR=INJ*(k~yAemP8E9!{S)LHe?izRc5?
zhtijiNnZ}rSBBG1oFIKgNnhdVD?{lk$E2?yeT*Ju!|5H7UOqf9t-x>>>$iGYHo=EH
zb~LWT>V}80mDa1nTw|m<Q8u=^k#U*PtHT6jq&iVHwz`pVh9zJcXHpnuB_q{|va!{T
zjGL@p9i}QH)rqpP)s2jUS-m>UUq-4EWn-%wxvx*@)nQUIQk^IpTiwWgI;U5Mna)Uc
zqD-&OId`<4y*J&e74fPCuT|_Q*8H8d7sT6%igo#D#lO)kwd7rDVQ|8mCf&wHuJXp)
z!Ryz4k$dyix8At+=GLokv5w(3R#(Eib<(oR#+UY&wqavcAD%=@=U>{E-MRGx3JNUe
zHcEBFt=3zH+pN80U;#W&n`MJVUAN|8kv&7msM{*7<^cB!?HtyctM#fGFe=1dzjT@F
zL4!miCkt+)n$IufsTtzMQ9PS=+sm&+23CKEz3=Ap`77B<0;~6hWap8~PsQY`4H8NM
zX!(7(7|8<W56<?7PmqMbn#QvG$eGoZeLq`^ldO{^GKQ-{4P)!iE}wE+ZrwaahUwNz
zmokxqfNcfF_NQK^zik9;J23o!^*&v-f8F<uyIUyogRS9|T<~xqF3Mo;?r<qC%hqRu
zWWQ$}AkAmNxbuTYM|zH~d$4tz+Sp^)dT7<X=LXM=!1$ek%eQ4kgOQHGN${?1(Tl}W
zOuSj73OCsnU2<sK>MV>GH&Pecb8T~cH`kKxTB~gz)6L`WmXZ3=dBK%2eG^!b;ZlNL
z9WF#Sk8NG&z31tk#`wn{h6nCzbD!>RjDT99olaRM!)gP~L$gzOY1&Sa7`AieYW5rk
zPq|U*mhy`%9Pu=e=$>-cVswfR{BTU=pJmw}1G~VeBM#pPiZ@nDLBp-{mTCy+;_PMd
za4F0-+$B79@EozQD;Ddt8-3mTe|^Q9eK84ZYO^2{+2y09K5@5a?FR4mtO(l-ZoJvs
z#P18XHE{Y{042qHACGNQfpJ(+KtZ~{Wkn84ieX9gu*AiPym@`oau~fIyS>d=aHEI1
zZ*Lnc*uL%4;Mn)Y6kyiM+@53+EUK_P{^_dX9i`T_i(%L1MAu^XUDuwlYvDCxyLKV$
zT1Rv(cHedF3A@%|G^6ErZEaRqH-AgaKc2Xlvi>M<Z^p0|2XNVVU_Y=86XgabDfs&u
zcmD(XFrLJqVeCKrs|$XfekUIs(C=jWi!kkb3={9Qe=p9k-)Uz)$A=o<h%=wRaOZJ+
z!x7dd%INV)FU9dB)&3}^uNK@Go|d>ja7XY@LJD|Vin$V%E0ZMgB|}P#XFf^FC2|Ra
zfBJAS)~Ga^<0?TXjhS$b*7b$`g>9V1GvSAqk-oLm%_L$5+K%I=yBRZPMezKh=ovag
zN}Qh_U53uylgpP}F%h0zFV!~SD~p82*Bxq$owyUHX`SO*{GslwB<U)4_EN2UUVKD?
zF8NU_|GWrr#SDhod27LA_=*7si}GNJ4my~LE`&s2BckAl9OVUzM~IjxI6}mE!O{^T
K!LkW5BKALx71wzH

literal 0
HcmV?d00001

-- 
2.33.0

