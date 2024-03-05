Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp334134ejc;
        Tue, 5 Mar 2024 07:01:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU+LR90wtl4txMKogqzdreG2sHL5i3dViIypfDDAQTbh36WTImswN64Wdn0ChHYn5Sq97n8pn8wv5/fAZVKV5M891aFBfHu
X-Google-Smtp-Source: AGHT+IFo8sNGVgP2sWJpNKKn5Tf+pwKAu5fiAbJF9hUqYJvHEjI8BByLbRqoCO6+SJGQSwER6cqm
X-Received: by 2002:a05:6122:4690:b0:4d3:4040:a00a with SMTP id di16-20020a056122469000b004d34040a00amr1932519vkb.3.1709650876488;
        Tue, 05 Mar 2024 07:01:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709650876; cv=none;
        d=google.com; s=arc-20160816;
        b=mP6WtWergys4U36FGWw8pyEWL+2EHWwduam60Ma4C7SLcRfJmf/CREOLDJmNQfIHSv
         n5Gvd3EXEXi41OaXvIwxuXWKbi1yQDAXYg/VUqhZgdFEujXuTUGikVnmHtE2r/0cirM0
         LLYSJDZuBDyY4urKjQJnGF9zLbC1b3gyfLITvQcYufnRO++QWWeZGMLUFTl6Gkvq9ZB3
         UDu4aZj7ezzRKJD9x2w3rUMRPiWEH4JoKrNpQiscGgz2ULVC4L1uMBZfZC6Wk1aTvYb/
         IJ4t4AJdz6llmHU5jCL/67Tl6BYaohgsvv8vUQJNh9vRuDIflROZFmDyqKRryJ56r5pU
         wzKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=tyOqbtrooBEkGX3hiQNuh7eDEtweuEgTU4WpaFmqj5E=;
        fh=OwtIYMY0+00dD+0OYwGlMmiEzgLSCX0RGHgJTct538Y=;
        b=swLhrhSfPI0IiGRqLaiNZC/jCa6doBIMQcKBqChVKWGRps0syPlkMe0CmxocRM6hgZ
         AE7c5n3wcv6JE7D7GKvKLiSlaGHSIaa0DzAcZldZWEVVuio3WUCxSAYTGjfkJiDDqDSH
         DD+oRJDBkdDIFICf/HoBasgPq+GD4yiXPderN6qToUUcjJTexpO7J/bhy6PiUNAjVsLR
         BZyWpJvdctdJxebuJH9n9YUDciuKNYWNM3fNv6oYDh9MyQjv12qPj6mM6Cbp/9zUNsca
         cCynkjFVL0+zy+A0ZcRY7U9gi1/MJr4lFvBlxjvgLIhqBclnVQ7q6zJq0/BFh4z+xGDc
         PhVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kwmpxs5O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6-20020ac5c966000000b004c0adac1ddbsi1680898vkm.120.2024.03.05.07.01.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 07:01:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Kwmpxs5O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rhWGj-0003Vk-DS; Tue, 05 Mar 2024 09:59:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rhWGY-0003EJ-9C
 for qemu-devel@nongnu.org; Tue, 05 Mar 2024 09:59:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rhWGN-0004MV-NM
 for qemu-devel@nongnu.org; Tue, 05 Mar 2024 09:59:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709650766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tyOqbtrooBEkGX3hiQNuh7eDEtweuEgTU4WpaFmqj5E=;
 b=Kwmpxs5Ojy5/kkMSoZgt242aBjqsONFMvryRs8D/ptzCvfY2XccxhTFQwaG07dleTn7LgQ
 BlOubbUkPVUxHnwLG8UigwO4BzAXeXx19kpGUB1CxXFzB9rlkAlETCN9oaOfeJ8lpAUFGG
 L3IyqpS6GXodHK2P0WiD6xchgv6Iezc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-175-CCnVnS2VNvSgV0NhqC-Gvg-1; Tue,
 05 Mar 2024 09:59:21 -0500
X-MC-Unique: CCnVnS2VNvSgV0NhqC-Gvg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B156282D3C6;
 Tue,  5 Mar 2024 14:59:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07DD42022C25;
 Tue,  5 Mar 2024 14:59:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 065B521E6A24; Tue,  5 Mar 2024 15:59:19 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, gaosong@loongson.cn,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org,
 david@redhat.com, iii@linux.ibm.com, thuth@redhat.com, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH 0/4] target: Improve error reporting for CpuModelInfo member
 @props
Date: Tue,  5 Mar 2024 15:59:14 +0100
Message-ID: <20240305145919.2186971-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Qh9/zisORlCp

Markus Armbruster (4):
  target: Simplify type checks for CpuModelInfo member @props
  target/i386: Fix query-cpu-model-expansion to reject props
  target: Improve error reporting for CpuModelInfo member @props
  target/loongarch: Fix query-cpu-model-expansion to reject props

 target/arm/arm-qmp-cmds.c             | 15 ++++--------
 target/i386/cpu-sysemu.c              | 34 ++++++++++++++++++++-------
 target/loongarch/loongarch-qmp-cmds.c | 17 ++++++++++++++
 target/riscv/riscv-qmp-cmds.c         | 19 +++++----------
 target/s390x/cpu_models_sysemu.c      | 30 ++++++++++-------------
 tests/qtest/arm-cpu-features.c        | 13 +++++-----
 6 files changed, 72 insertions(+), 56 deletions(-)

-- 
2.44.0

