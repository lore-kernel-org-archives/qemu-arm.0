Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2755776ejf;
        Tue, 27 Feb 2024 07:49:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW/tH04+MS7P2Zz9L5EP1aLMJhs1HQahA7hUrUc925lWyQNQswMFdLOkGW8St1VvgAEq8Pv7PintZniaDGX5bMl999RHp8R
X-Google-Smtp-Source: AGHT+IEa19iyWkNdRc9GDAJZqPPnpDdV0uobkdvg7TJd3MUX3Zw91zpNaDeQwfztvDaDnOHj3/Ym
X-Received: by 2002:a05:620a:290a:b0:787:b833:7036 with SMTP id m10-20020a05620a290a00b00787b8337036mr4083733qkp.6.1709048963876;
        Tue, 27 Feb 2024 07:49:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709048963; cv=none;
        d=google.com; s=arc-20160816;
        b=PBosvNMFgz3YRK6Y9iLkc6Te1dhAy9pggH1YitsoaDXHOCQ0cNLOykZALq6fIvSfK+
         rufovsD6CPeaOHEOkZHQrvogM320GI0a8ZEO8wZVxdUd6P3R5QwIjs6Ei1hWSb7h8rw7
         vjS0M5Dz5S9pik1wKbLGuBnf6rHo/UvdPThLZBHD3UYbGSg4mF0StOIAnGQS6TpghvQg
         zIEbwrSFMLc5yL8hwzuRo5saaEGCAbnbfz3oO/KzfHyS4ND3YTZ40PLT18vclt/BSI3d
         H9+bjzddH0Rbkj0Mh/QqwFhadXZhJ3ntcUBCc9Vdm2VTVym92zbA5SJ0/ClMkpQZtlwt
         ekmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=G7TlSRlVq64jg1HkC5F8kkyIb2nzESAMpOD0ExkkleY=;
        fh=cWYLLp2xiaCPawONafvmArBA+kFDFtOI7kkn8ypnRsk=;
        b=Cxf4fIs0L26hEfd/wvAgqmX1OaXTEdkQKHjnzXlnShhx59kYOpOB7S/x2Xd2QCbhEy
         +UnL3CfdSb8EPQIkv/28lmxX7QY9JqN/nb3UejCcUcHXV9Acj6fIU2gVty0jm/1yNNVX
         8tra522BAeMKDyTJo6lOcp7yPtAlssh+ByilV+sYW/2oJJplRtz1UCBF53fJ0P6/IVT9
         z1AB3mzzshOdHIR5cNTaE2LSUcezu0NBjzQHsEm/az+oZsuX25OlXTPS0T5xtNbjr/us
         5aDxcm5ODQ8dcPhwOJfKvRYZttBbqKe060kwYbrsZcDsSs/bz/ypzE9mdIFyXNQ3y1kQ
         4/XQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VfocKTR3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id wn18-20020a05620a585200b00787c6968d24si7190692qkn.772.2024.02.27.07.49.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 07:49:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VfocKTR3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rezhT-0006eU-FX; Tue, 27 Feb 2024 10:48:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rezhN-00063l-F4
 for qemu-devel@nongnu.org; Tue, 27 Feb 2024 10:48:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rezhL-00005A-SZ
 for qemu-devel@nongnu.org; Tue, 27 Feb 2024 10:48:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709048931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G7TlSRlVq64jg1HkC5F8kkyIb2nzESAMpOD0ExkkleY=;
 b=VfocKTR3LgKILA5nLjvRrcChap+haALRc4L4avbpSFeEoH7kZoDeuefxP5xXJmdOQ73uJH
 qorSig13eaWjlS2n+1mrP0ivqefc81uJDjtxnoX47pfnMJ0YOhXYtWJlKkoOsT0/XgWHS0
 3puwRElO9K/YaxeUCRws9OMJpQD8FRw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-cdyYY-NLMSKM2BgzE4jwfQ-1; Tue, 27 Feb 2024 10:48:40 -0500
X-MC-Unique: cdyYY-NLMSKM2BgzE4jwfQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6992845DC9;
 Tue, 27 Feb 2024 15:48:39 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FE822166B33;
 Tue, 27 Feb 2024 15:48:37 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, mst@redhat.com,
 gaosong@loongson.cn, alistair.francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, imammedo@redhat.com, anisinha@redhat.com,
 philmd@linaro.org, wangyanan55@huawei.com, eblake@redhat.com,
 armbru@redhat.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 f.ebner@proxmox.com
Subject: [PATCH 16/19] smbios: clear smbios_type4_count before building tables
Date: Tue, 27 Feb 2024 16:47:46 +0100
Message-Id: <20240227154749.1818189-17-imammedo@redhat.com>
In-Reply-To: <20240227154749.1818189-1-imammedo@redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: B+XzCD9WEdiz

it will help to keep type 4 tables accounting correct in case
SMBIOS tables are built multiple times.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/smbios/smbios.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index bf5c7a8885..b64d3bc227 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -981,6 +981,7 @@ static bool smbios_get_tables_ep(MachineState *ms,
            ep_type == SMBIOS_ENTRY_POINT_TYPE_64);
 
     g_free(smbios_tables);
+    smbios_type4_count = 0;
     smbios_tables = g_memdup2(usr_blobs, usr_blobs_len);
     smbios_tables_len = usr_blobs_len;
     smbios_table_max = usr_table_max;
-- 
2.39.3

