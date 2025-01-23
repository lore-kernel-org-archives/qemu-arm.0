Received: by 2002:a17:504:17c3:b0:1be9:327d:8ee3 with SMTP id o3csp150782njd;
        Wed, 22 Jan 2025 21:49:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV5NbjRXdfs/iVis7YF6CgMJ+exnJ/9xbnilO8C8y8bp9a/xB1QWgSMkxODmCiMTyvGcsL6zoVLxsyncg==@linaro.org
X-Google-Smtp-Source: AGHT+IHCx5Y55yVNgSHyJ25WXBQCeNHYWMNMIlHgRsPR0YqyLDPECw26aawxbVKzwNKGuVWNKg7B
X-Received: by 2002:ac8:4819:0:b0:46e:24b1:dcd1 with SMTP id d75a77b69052e-46e24b1e127mr235991221cf.32.1737611350372;
        Wed, 22 Jan 2025 21:49:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737611350; cv=none;
        d=google.com; s=arc-20240605;
        b=jeV26KJxbsrVDmvYAGd1S2rDgN3s+g9InTkE/3G/pX6BlGVddsVEonbS5UdsJzURBy
         DJT6DZB0pLVywger4Y5zWsUEzUHgFb6BflSNbV4ViMiOJaHA6gOjivcMr37oWRCetaD8
         ipZT24dwTg55W5f+mwfPsOM3F7jP2elWW1B+CES/rtP8arnSEfdS+OBttHaVrvnYHYnl
         ov+LH6iv/P9WEIq0jbQKYaCLPjPwzXUJaSrhI4Ji6YWujSr+c8opbcywxZbNeK795qnc
         UzhOl7sSEKZsvVSrT0H3bVZD+X/Rl+tHoHI4r/X82s0GKwygaI3fWyHtovh8OBv7tti5
         f9Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:date:to:from:subject:message-id
         :dkim-signature;
        bh=iw48HCK2T+w5n2vzZw8zqqO+m/BwNICWK57PvNhGtDw=;
        fh=DBwo5oYV+Zl89FPcGyBzo6mnqwnGCoM6YpiQGc4/RNc=;
        b=a8fo/1aQN02sSA42oVrSIN5LZBeVkk1YyRl+vDc+YqyQnUXhfdg9vhmrYaByM3l2xy
         0mSafx9wdoj6UyOc4nfPVIGnad97d2hAtjWjIzhgdTt+Av/RoDa2QhOz2h4JeTs7bLf8
         QgcbOtXzrALMgc4Q2nu0iX1YGFc3uWw9k6dIq4hVcsh9RguTvKZXQXux463hky6PciFp
         sOl/te6VqdTNAk2xmmFNJ4bACufV5stxav0hUmUGP6oB5BVq87X735U51JUUfzjUc/S+
         /Y2cR8oiI5WhjlXBVkfRZyi3z8ZFlFn3J+S1lWNtDHfHk0nAVgXO8rbkW/VvQulnU14P
         YgwQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@qq.com header.s=s201512 header.b=TDsZ3zLQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=qq.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e1bb1cf26dsi147327736d6.258.2025.01.22.21.49.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jan 2025 21:49:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@qq.com header.s=s201512 header.b=TDsZ3zLQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=qq.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taq5N-0001Ff-NQ; Thu, 23 Jan 2025 00:49:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yfliu2008@qq.com>) id 1taq5L-0001FA-9k
 for qemu-arm@nongnu.org; Thu, 23 Jan 2025 00:49:00 -0500
Received: from out203-205-221-191.mail.qq.com ([203.205.221.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yfliu2008@qq.com>) id 1taq5I-0003lv-6M
 for qemu-arm@nongnu.org; Thu, 23 Jan 2025 00:48:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1737611329; bh=iw48HCK2T+w5n2vzZw8zqqO+m/BwNICWK57PvNhGtDw=;
 h=Subject:From:To:Date;
 b=TDsZ3zLQV1OzFCZ31yabQ49fn7+v3TUYmuEw2VwNF6/DLmfMtoT0EDtYAyAX/IbvU
 i1JRoWNCcHVeC9q7nLaXzj2dcHPRHKHGpVX9Hrphd5zTYbTM0UoFNZebcSvRUiYMBj
 oAOQNkVah33tRo/LMbAAhqFV/46WfGGXryLgp3UM=
Received: from [192.168.1.13] ([171.213.188.20])
 by newxmesmtplogicsvrszgpua8-1.qq.com (NewEsmtp) with SMTP
 id A5629C38; Thu, 23 Jan 2025 13:41:22 +0800
X-QQ-mid: xmsmtpt1737610882tddsbsq74
Message-ID: <tencent_E57788874AA996351A24997957BF2FB25907@qq.com>
X-QQ-XMAILINFO: OVHKTxwP+QXVshd0/zfPx+U7xLi39sIGuGbJOcY8kGiNbHh1E53D7thosmToEb
 E/IGTkYloin8UupuuUewICFf1PM3+oWczL2lKkcNQ21LhU4AzdtDpxqAK4R8BT8L6OQYM7KlKjaW
 tHnboFh8lXLIt7rXgAuVOXmoQYGMRlAZAL1l1htZ3Pg+ReFvozYlbueTRoyNGic/UnNFVsa9YQA3
 ZulFxZpKmsCsPTfEbMNxxpCuP58V+4XA1YBxFPeFKnIvsBq70n91O7wWsscjAB0is1d/UpwC60eK
 8EecD6bgsN6pDzCQa9xb0U1tpFeu81v47c9OTNhjWrgs5+iMe1RcG/9yrq31a3Ggts8h0IOPxzy1
 wDEsLb/wHzOlWjwNo/S9WXOdauNKNCh5quWMA8kFFMXElX8zzUATZdNdNVJ70COdWB2s+Q8rHejw
 3yEpUPxhStrvtEYIjqq3m1qkQ5IKnj9lE7hol3RQh3JtT1uxjRAoJO1ivzjVaq8/3mlgvBjhsS0y
 A0337tfvNaRmNK1ZrJX8bkhjLdTAAtKEasPb09nIsxmivh07D3iIvAU+txY0FjwYUDBm+XuP3QIi
 loYPtB8bGxW0Vc5KjONgOzOQSqPL9PzCCd3FKcfCyC3GTWUOiQfqt2scDc+Ye9EvpMgN0nzhRH+0
 LJOn7YTLbDCAa0XG7nQTGah4pvetzmZh7WW7dIdUOUvIYjdUsOA+VllJqPsSdmzKhjr6+WfKKm1A
 bQ+Y83Pth9A9JoTblLOO0OaGpjEB2Uz6A+UGtvKCFLFSsgt2oBmicP7fP2aJcu0MCAvU3QgLDCvS
 +pNuerIG0uQ57AnavAlcNx9njq3lhTLp6DoCF6/2F/p9uMaJp+GmcF1/U3PaKxEsJCcKSHL6qyl4
 9ZambAlWBHjF8uBV/c96P576YlxQ5kuaqzKtNQBRSJxlBD92ZBV36g3L3ALVtTiKQsfLU+tohWjL
 mzQzXcidgelaeD2e6vEUSpgbxE/c5u
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-OQ-MSGID: <4e5ecc8c55391f879a60015f31089fd17228a100.camel@qq.com>
Subject: cortex-r82 support
From: Yanfeng Liu <yfliu2008@qq.com>
To: qemu-arm@nongnu.org
Date: Thu, 23 Jan 2025 13:41:21 +0800
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
Received-SPF: pass client-ip=203.205.221.191; envelope-from=yfliu2008@qq.com;
 helo=out203-205-221-191.mail.qq.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, HELO_DYNAMIC_IPADDR=1.951, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RDNS_DYNAMIC=0.982, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: q3gn8zh39GO5

Dear experts,

I am wondering if there is anyone working on Cortex-R82 support?

Regards,
yanfeng

