Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp297386ejb;
        Thu, 8 Jun 2023 05:25:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Ekea5caLhTCMz59RTvhT/U5I+lKqqUkFb2nmpomnN/ooPA56ZoF6ONRLtmNmNy2mC6xTD
X-Received: by 2002:a05:620a:4409:b0:75d:649c:2cd3 with SMTP id v9-20020a05620a440900b0075d649c2cd3mr6894245qkp.61.1686227108355;
        Thu, 08 Jun 2023 05:25:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686227108; cv=none;
        d=google.com; s=arc-20160816;
        b=rl29sxF8ltrHRYw7TSUWC9ZcWUAl1y5JRPykhLU5zUVl3dW0PiAM9ldIgh0ekzQEcU
         enpyA6OG+jdkOpHNlBvYGgRCAtbtRt7es6f+5k+2rF4seensNOUXEppMESWrE6/tC12P
         cT2Vb0yJDt/HIWr+g+tdQX4RGyd0xnXQ0qVwImJ2+oeofdx79gQTvfoj28BWz6157mj0
         MWAueH4YId1SwPezPkdD7NWeDCspOxeJuhUXCowMV6c3DhCNEjZWpQ+TG3PbKknJETe6
         1ODT2L9TG+gMO6b2HqK0D4tZSgOPPKVtxEMpzqqPUItm9aRv0JKgDoqZngXpFGGA78nJ
         MWVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
        b=oXqZKqidbxXxPj/6fXgMRg62Sa8vEwus43tfj9u72jm4cBehSXFz4iLrZ0RINXM0AE
         pSyENopnIWEz+HxpPE4nZRH+QUbbPyRJ/KVP+llgkuCE5M0Yu78AO3rOzpbrZRB2sYD6
         8Pd+gObO6O3is1bdXoJ/o6qRKpIKRSrm92iYyR8ayCMO4iJY3EOq11ovoSX0qWjNaA9S
         26+FVjsL7Xsxu6sFPVTTHeQvHf/5QKWLUGwXk2xqWmwNMdN2ak34xJ7s2VMheMKQ8mf3
         byLTLc1oZHJUpKr6DeZPl2x1IX8g0LLfSdsYKPGqFnqkPwgWUQvGw1tMR1J4EkOyZ4Vs
         K+pA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BPE7h7Z9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2-20020a05620a000200b0074a2b7c652csi505936qki.113.2023.06.08.05.25.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 05:25:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BPE7h7Z9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7EhI-0008HW-2E; Thu, 08 Jun 2023 08:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1q7EhG-0008HF-1D
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 08:24:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1q7EhE-0004Fd-CW
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 08:24:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686227094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=BPE7h7Z9XBdnNY5tXWDTL48Dj1AAELyADZqFPLrUCf6YjRPTOq1iOOVUUR7ejy+UZZHN1S
 iNQaaR8lsGrBAzQWbS4gU5VIiIy3KTz7+yy25wiZvYck/L+XacEiGKwfCWpo3zfDjy6PwO
 VnUw186KBJ9dz43FT/IWL2sPVYRwgaI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-ypYIIG8BMPi_TbOK_YRBJQ-1; Thu, 08 Jun 2023 08:24:53 -0400
X-MC-Unique: ypYIIG8BMPi_TbOK_YRBJQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9715654aba1so77687766b.0
 for <qemu-arm@nongnu.org>; Thu, 08 Jun 2023 05:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686227092; x=1688819092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=kui/lhPIKSqvFsyNvnzzri0Ni/EZQyPDIIvz80wLwT8wpC0Iy6nHnfMfMy2qns67Oe
 lGJt1Q299HknllxVK8I7TABq9Kcgnlj6teRkxU+IZ1dJU84zzRFEyLEhbmprwttKr+a7
 fmeT9nam0eiQ8WL4a9riZ8wOVBU25oARSJLw+o9qbQuvG+5GPMW5KxEMl1qlb/C5affb
 ygBM8zCoRzBbmeX/2pZmhiNo4NymXgOCo5KYBqGBQZ13I0vLQaAcjN/kdjEVpgUo0LBB
 Wooo07ElbuFZAQKLBK83dxkPbB3tbQl8nZ8zel0NIwg1tKISs7O55ANH5v269e92+jsB
 CLeA==
X-Gm-Message-State: AC+VfDwE1mrEO/asKG/dVZ69UxJioUr17GIetUkzXrHz1AKp56F8XLqO
 99PKSJb71qKlr/bupfXltR0hHOCc+aFF+A35NCZQSuUss1ri1Mj7rzQvYXHjikyMB9F9ntZ/SI4
 /ZC5pm5fS0YKz
X-Received: by 2002:a17:907:7f2a:b0:966:1bf2:2af5 with SMTP id
 qf42-20020a1709077f2a00b009661bf22af5mr2086589ejc.22.1686227092613; 
 Thu, 08 Jun 2023 05:24:52 -0700 (PDT)
X-Received: by 2002:a17:907:7f2a:b0:966:1bf2:2af5 with SMTP id
 qf42-20020a1709077f2a00b009661bf22af5mr2086571ejc.22.1686227092220; 
 Thu, 08 Jun 2023 05:24:52 -0700 (PDT)
Received: from [192.168.122.1] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 n26-20020a1709065e1a00b00978897577c6sm631890eju.44.2023.06.08.05.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 05:24:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 pbonzini@redhat.com, imammedo@redhat.com, peter.maydell@linaro.org,
 rad@semihalf.com, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 thuth@redhat.com, lvivier@redhat.com, ajones@ventanamicro.com,
 berrange@redhat.com, dbarboza@ventanamicro.com, yihyu@redhat.com,
 shan.gavin@gmail.com
Subject: Re: [PATCH v5 0/3] NUMA: Apply cluster-NUMA-node boundary for aarch64
 and riscv machines
Date: Thu,  8 Jun 2023 14:24:50 +0200
Message-Id: <20230608122450.915545-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509002739.18388-1-gshan@redhat.com>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ExwdT3yqR0QT

Queued, thanks.

Paolo

