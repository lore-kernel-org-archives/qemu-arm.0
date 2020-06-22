Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3221111lfm;
        Mon, 22 Jun 2020 07:08:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHLsokI8a3v1rFJgN3TSG9E3WuLSA8EMFHM8pHQbr7QydG8ZLt7gGGC97rFqmxGxYIR3qL
X-Received: by 2002:a25:804b:: with SMTP id a11mr29295063ybn.84.1592834931836;
        Mon, 22 Jun 2020 07:08:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592834931; cv=none;
        d=google.com; s=arc-20160816;
        b=GcbwISX7ZPK2MdEY5+A/B7nBoB6eKn2JpYc4FkrIw1kIuQvvJ93fE6/3sv4QqjVd91
         lX0LKiy2GCqV4UxCmpqnMjO5Guq3DB/0cYUFU74W+/AJacsqJCc/M2wSy94EXd3JthKn
         jz9TilrjDnOpcC64LOPtTDsxFcpzJ+kBhAbqS5OKs/bpCNE1lsBRmwFNA9BYgzXeOTAI
         Hi8JnfyJun9jwFaS729l5xM9jVi0hhSUCV2nuShLmWn8U/wqQNTP9HMliujNKoUjTRPv
         ZP5UHDCnthob+3/1M1xulE9DiPir0JZt0r4RVwZa+OuvwlxUJUAX5/TIStUPonclnUO5
         QiAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=AGCYoDDWC27/vDqcwRPzgnEr51neGV9WUERuFPPBHcw=;
        b=JzzfAkZNtj9sIWmZsPIoW5zQVr0/gy7g2wbt2d2FZwY7hqCSKiLagDiMItSmYSR6j6
         NQc1jR04t7zXymXTZPvgC7QQNFDb4+QtaFC5IvB4iFFSJ6EaC/YT5CC8EeRhHj4obAw9
         CGg49Fa4BQbdtPbNFw20v02JFNkSyQKLJs/T7QQTDMbzRNMw1gylV/V7OLX51zbK/LCt
         vfTrvxEpI5MMeQkSrOB9he3w+aZpfuGmdl72rXoB5KwUpw0FwnfsXNp4WTIJKWJ/BXN4
         OoZzI+zyApJM5T9eyxb4RTb156cS+uDNP+F4ipZJtt6uI/b1BrX/4HfPQGU5NSfJp8pm
         3vMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ami9S5zS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f65si13513331ybi.147.2020.06.22.07.08.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jun 2020 07:08:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ami9S5zS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnN7z-0005Fm-7I
	for alex.bennee@linaro.org; Mon, 22 Jun 2020 10:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jnN6B-0001jy-LP
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 10:07:03 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jnN6A-0001Nv-2P
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 10:06:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592834817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AGCYoDDWC27/vDqcwRPzgnEr51neGV9WUERuFPPBHcw=;
 b=ami9S5zSs+fDJE/E1UGQS2so2mMFcuHWQugioD12P8Ii6vRREd9B85CH+hF7LrLeyxHMcR
 wUEz1d/Sq2T/AUh7oGVr7+hfeC/eMm5TRsBw1rxF1bkM9toO56ROQFOvWnSkLMhw+b4Z9g
 aJnjwKj1B3cgf6cMm8scj+m/ect9Fu8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-6RkE_tS-MCCz0lH8I1ureQ-1; Mon, 22 Jun 2020 10:06:55 -0400
X-MC-Unique: 6RkE_tS-MCCz0lH8I1ureQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0211801503;
 Mon, 22 Jun 2020 14:06:53 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78AE02B4A6;
 Mon, 22 Jun 2020 14:06:42 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v7 3/3] docs/specs/tpm: ACPI boot now supported for TPM/ARM
Date: Mon, 22 Jun 2020 16:06:20 +0200
Message-Id: <20200622140620.17229-4-eric.auger@redhat.com>
In-Reply-To: <20200622140620.17229-1-eric.auger@redhat.com>
References: <20200622140620.17229-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 02:57:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: thuth@redhat.com, lersek@redhat.com, drjones@redhat.com,
 shannon.zhaosl@gmail.com, marcandre.lureau@redhat.com, philmd@redhat.com,
 ardb@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3JQ64cqN234d

ACPI boot now is supported. Let's remove the comment
saying it is not.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 docs/specs/tpm.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
index 5e61238bc5..eeeb93730a 100644
--- a/docs/specs/tpm.rst
+++ b/docs/specs/tpm.rst
@@ -346,8 +346,6 @@ In case an Arm virt machine is emulated, use the following command line:
     -drive if=pflash,format=raw,file=flash0.img,readonly \
     -drive if=pflash,format=raw,file=flash1.img
 
-  On Arm, ACPI boot with TPM is not yet supported.
-
 In case SeaBIOS is used as firmware, it should show the TPM menu item
 after entering the menu with 'ESC'.
 
-- 
2.20.1

