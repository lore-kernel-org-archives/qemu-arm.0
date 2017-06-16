Received: by 10.25.0.23 with SMTP id 23csp1321665lfa;
        Fri, 16 Jun 2017 07:44:36 -0700 (PDT)
X-Received: by 10.237.62.135 with SMTP id n7mr13844056qtf.0.1497624276650;
        Fri, 16 Jun 2017 07:44:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497624276; cv=none;
        d=google.com; s=arc-20160816;
        b=QvB8n7NBXUA4p/GqFZSAcm9uWuy02pLJu+STxyVJHrLjJcvVxiHMkl9ZFsnQwYtUTL
         IYo4yKhzoPUrloPWSJkqYA6hE267BzfsxFGlU+q6uBf2KoHGMNgDc3jdj0APHB8uItUQ
         KHr1IhNlIAGX7FRFICcgkqYCl20sqgNiQ7iEoi46PScIqAGDUDnqKEAi3gJ/wqOjHulB
         zMO6RPifNvjPNlzT7VPCg7q7VfuOER0crolae/0tz3RgTyFy2ETVVKaL+ZU2ohvgzwEf
         7OMXZpYUdvPcM9NPjlaxHR0OA2ARjsHjHD012lfH9WxGGbUBBSqKUTwsqvnfjivB+aCn
         D1jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:from:to:arc-authentication-results;
        bh=OL7v5nUY+0n+ZSlNRqOdZfDqkgWRk8b5jdMId6UtnTA=;
        b=PYtsPKc5Yh19KJoxQBYLWjx0hT7r8gU44oQJHQRgF2ryeKAV5Y2vPIlTRtQY9CK0tO
         rQVaj/dJRm692fr0lxdjHcAFWqyxOMTyJ2ECU9+BFyo6iHtYQKylS+H8DhfCaVrsTSiK
         b3+EJok+tcgxySw7VpE0fL+aUtLq7fqsBjXsuJGhl8/LSr6gU3cDO9xl6Paqj830t4F4
         4YtZA4eG3I3a//sws4ZqUoGRdNC1M1VkGO/YpYOHOnLPRXTzfhjD91kUMHKh+fUcr9fF
         xx5KTDLCSGhf3yUabYOZF4zQT7YQyDaUcYcrQMXmt9Y1eXxw4mx9W40hfhkojyqA+W/q
         9d3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u65si2118255qkf.84.2017.06.16.07.44.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Jun 2017 07:44:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59254 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dLsUD-0003M2-SS
	for alex.bennee@linaro.org; Fri, 16 Jun 2017 10:44:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47245)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1dLsSX-0002Jm-RA
	for qemu-devel@nongnu.org; Fri, 16 Jun 2017 10:42:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1dLsSU-0007Vq-Ns
	for qemu-devel@nongnu.org; Fri, 16 Jun 2017 10:42:49 -0400
Received: from smtp1.lauterbach.com ([62.154.241.196]:38629)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1dLsSU-0007Ph-Bu
	for qemu-devel@nongnu.org; Fri, 16 Jun 2017 10:42:46 -0400
Received: (qmail 26356 invoked by uid 484); 16 Jun 2017 14:42:26 -0000
X-Qmail-Scanner-Diagnostics: from 41.224.44.126 by smtp1.lauterbach.com
	(envelope-from <abdallah.bouassida@lauterbach.com>,
	uid 484) with qmail-scanner-2.11 
	(mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
	Clear:RC:1(41.224.44.126):. 
	Processed in 0.328541 secs); 16 Jun 2017 14:42:26 -0000
Received: from unknown (HELO [192.168.187.23])
	(Authenticated_SSL:abouassida@[41.224.44.126])
	(envelope-sender <abdallah.bouassida@lauterbach.com>)
	by smtp1.lauterbach.com (qmail-ldap-1.03) with
	ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
	for <khaled.jmal@lauterbach.com>; 16 Jun 2017 14:42:25 -0000
To: qemu-arm@nongnu.org
From: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Message-ID: <1701daf4-b2de-a9fb-7337-7aa791676516@lauterbach.com>
Date: Fri, 16 Jun 2017 15:42:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 62.154.241.196
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: [Qemu-devel] [PATCH] target-arm: Bug fix in filling the cp_regs
 hashtable
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
	Khaled Jmal <khaled.jmal@lauterbach.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XNV8n2lLwTrN

Check if the CPU supports AARCH64 before adding  the 64bit view of
the coprocessor's register to the cp_regs hashtable.

Signed-off-by: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
---
Bug description: if a register has the .state = ARM_CP_STATE_BOTH, its 
64bit view will be added to the hashtable even if the CPU is not 64bit.

  target/arm/helper.c | 12 +++++++-----
  1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2594faa..7fa2889 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5607,11 +5607,13 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
                              break;
                          }
                      } else {
-                        /* AArch64 registers get mapped to non-secure 
instance
-                         * of AArch32 */
-                        add_cpreg_to_hashtable(cpu, r, opaque, state,
-                                               ARM_CP_SECSTATE_NS,
-                                               crm, opc1, opc2);
+                        if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+                            /* AArch64 registers get mapped to 
non-secure instance
+                             * of AArch32 */
+                            add_cpreg_to_hashtable(cpu, r, opaque, state,
+ ARM_CP_SECSTATE_NS,
+                                                   crm, opc1, opc2);
+                        }
                      }
                  }
              }
-- 
1.9.1

