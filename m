Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp625497lfe;
        Fri, 20 Mar 2020 02:24:52 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsW1g+bloCKwXTkO8SZxxcp1eP/WlKkVXpLIx6larKh85BrLMSicoI6UVq57/ZmL+sPjrPL
X-Received: by 2002:a9d:6c4f:: with SMTP id g15mr5849269otq.76.1584696291997;
        Fri, 20 Mar 2020 02:24:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584696291; cv=none;
        d=google.com; s=arc-20160816;
        b=BTwfQ0PNFdo12UcH7LLMi+vOakTsgOq+ehKbh4Jh3UNqo3uz0FlJib5JogUPqejYAh
         12DXJcuidkK2cpay6TO96WwdR0KaDlE7OsOSvP++Ygbt+solqOsnP0fq1ru/tH3Q3q2V
         u8Frz7zS1ec6D2JQ9sEc3Tz1VwoJdJBxWoL9hWJ7z6J790slfYM5dk24Ox4URXRSzr1C
         t3aZLXHDDQDM7OPQB4YRNtixEak/WcVhDFmgVjwYAT7/8pTXqRp0yirm8E81GcB9XB7l
         l1xwimiqWKAqKv7NiHGyIXvKQeduQ+bvRR7WwFBZR8MLeuMKGVsw5sNXAqGTjHPR975Z
         TvLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=g1Y7SAIkQ6YKL70iv+PevVOHVnPkk+5bW/+E3fVVoME=;
        b=DuPRhYNlFUxVQialTzDC0p1y4qgU53xj6+jXNDHGR4UOoe+tn8y9JLzX1XTezwOZiQ
         CiH/Dd/MXddLJDjskf26vgIenX0VcFH3zjGl9b0UM+qfKkxSdGn52T7/+o5dBHPByDPd
         GzQIIzi9WFdS0xLhv2uJsqop/+EuLFNGE+HG2Y9MTCXBmsSYK53HWpseJJ7QxZimt+2J
         KeKAZwdcp6aJ8Y0AJlSMpR7SuEhdxhZv04lX36Wnf0eZHwaN6y7xNKuQsHdp+NtXMUR/
         Go+oGsiyBozBDYxXh9skBv8PwG4rnXbUVQta73A2YUEO4KKTWPT1l91oKG8IanqTGMCu
         lWvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XPDaqeu6;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id r19si2659385otq.241.2020.03.20.02.24.51;
        Fri, 20 Mar 2020 02:24:51 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XPDaqeu6;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgCTJYu (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Fri, 20 Mar 2020 05:24:50 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:52701 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726791AbgCTJYt (ORCPT
        <rfc822;kvm@vger.kernel.org>); Fri, 20 Mar 2020 05:24:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584696289;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g1Y7SAIkQ6YKL70iv+PevVOHVnPkk+5bW/+E3fVVoME=;
        b=XPDaqeu6rrCWTGyDosgmPLheqiMB6puA43tar7wmYFlZHzFK9kck0mQNNIUnZyV6Zl1GbM
        IYLsUrdSlYLRcZsvp7MXSrj++3qUjwTMwldC4J44huCvHDtErjSoGVEM3ESjcwkLG81s4g
        +O2pc6C+v9rza7FGjfwPFlE4i3HFWXg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-YlwQy-4nODS1Pey_klco2g-1; Fri, 20 Mar 2020 05:24:47 -0400
X-MC-Unique: YlwQy-4nODS1Pey_klco2g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C092E1083E80;
        Fri, 20 Mar 2020 09:24:45 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-142.ams2.redhat.com [10.36.113.142])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0C0785C1D8;
        Fri, 20 Mar 2020 09:24:39 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH v7 01/13] libcflat: Add other size defines
Date:   Fri, 20 Mar 2020 10:24:16 +0100
Message-Id: <20200320092428.20880-2-eric.auger@redhat.com>
In-Reply-To: <20200320092428.20880-1-eric.auger@redhat.com>
References: <20200320092428.20880-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: z78/Quu2hO2o

Introduce additional SZ_256, SZ_8K, SZ_16K macros that will
be used by ITS tests.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 lib/libcflat.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/libcflat.h b/lib/libcflat.h
index ea19f61..7092af2 100644
--- a/lib/libcflat.h
+++ b/lib/libcflat.h
@@ -36,7 +36,10 @@
 #define ALIGN(x, a)		__ALIGN((x), (a))
 #define IS_ALIGNED(x, a)	(((x) & ((typeof(x))(a) - 1)) =3D=3D 0)
=20
+#define SZ_256			(1 << 8)
 #define SZ_4K			(1 << 12)
+#define SZ_8K			(1 << 13)
+#define SZ_16K			(1 << 14)
 #define SZ_64K			(1 << 16)
 #define SZ_2M			(1 << 21)
 #define SZ_1G			(1 << 30)
--=20
2.20.1
