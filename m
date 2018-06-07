Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2404682wrq;
        Thu, 7 Jun 2018 11:07:25 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJgfkf5xQmdq4rGW67PcvNLF2hMPdSW5efm4TQCbQrnQSs8vPWHFH8c2LsTO8I/2jkCaM4Y
X-Received: by 2002:ac8:297b:: with SMTP id z56-v6mr2704812qtz.387.1528394845581;
        Thu, 07 Jun 2018 11:07:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528394845; cv=none;
        d=google.com; s=arc-20160816;
        b=NPD9ZpU0tNT79i7K2+gJgclhfMwi6qP0anXIZohsMn9L4KPP+TWMBVuAdJKkNz1YLK
         PL1aqV1azfHE7lKxccPLJ/sjHZv5gk/4/egKXzq6/jP1hFdsYxqRQUFGhBVw8ikkC+OF
         TGFW1tHqUASSnsEfK55EoFGKnvjWXDIOIsDDYgZ5lxCeGPW4H4BSB3uNkUrObCd+5Db7
         Zx8xVPHiVE4DZDc1DO5Bq7Rrj68pr/yKQD0Mbz71qdjFRHWtDSuP+Uxyp1iv2kNXzwGm
         uoxxwxzHkDHuPM2oFRMAXc/ghrFBe51YVEuD4c+Ow5/0SZGvC+7iCTKZ6cpaS4ynOLyC
         k0Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=uuolPF/qep1do+QHIzhyDQZJtmzmVRMDR5bXzePYNiw=;
        b=Bin8BL3rqfddk0KjAIN0oMJw5hHQlLrQIj87lG6guuXLFBBEwkPXGuT7m2r4ExvIfj
         qiUkz8/FOYKIGmRb8vm+oOYGvCmGwj8OB+HJCZVVLNneaV0T7ooUIYnCUKRC9jrwNKbj
         3BaLECUK7dl45itVDa+IgxGZTRLYZFDKusCcPjhK42Cjgub6GZw7FbCrQsEWV09Q63u0
         kNUdvBpKFFNGl2fuE5Bu7618eYd5H7kJQtyTe2kxRlJY5VKb00nA6jUiKa5GE9/6ZH3L
         q1NzeYawuThx7gFqtvcimCVt7MNdGiFT9HG/qsmWQWFvs/6JzHFBenvVvrPTqmR8iYnj
         lVZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lMlkTjjj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t3-v6si15212567qvb.80.2018.06.07.11.07.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 11:07:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lMlkTjjj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59599 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQzJl-0002CB-2o
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 14:07:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46024)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQzJR-00027R-K3
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 14:07:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQzJQ-0004Tp-P0
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 14:07:05 -0400
Received: from mail-qt0-x22b.google.com ([2607:f8b0:400d:c0d::22b]:37498)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQzJO-0004SX-P5; Thu, 07 Jun 2018 14:07:02 -0400
Received: by mail-qt0-x22b.google.com with SMTP id q13-v6so10799766qtp.4;
	Thu, 07 Jun 2018 11:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=uuolPF/qep1do+QHIzhyDQZJtmzmVRMDR5bXzePYNiw=;
	b=lMlkTjjjIlmuyuW/Mhkkk7d/md6dgOYNWayG0NGUH6T/EEcZ/m/9sQWqmJA30s1feb
	duIteO9cykOGjGt07OwkMjlWo8s163itOmiJ5+JxL4MUpAIFx3aXNHOEzBd04jFZsu4H
	ujMmzm7Jfj5gtply54vOhL+Hd8cGyRvQwZUCayLhG5X6tcCdrrvRlRjlcMIybIoXC17N
	bVon3n6SFiPuLgnV1CGiGQ71s6T0F1OtkTbX6ThVzXq++D30DT+TTpRpDveNH5TIGd5K
	jzJndl6NeSB3DYqGu9cyKStRtjZNWUJ7M2xKnsHV9WAiVFvM1WVGBGc31o83NceWegfZ
	T3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=uuolPF/qep1do+QHIzhyDQZJtmzmVRMDR5bXzePYNiw=;
	b=oApoCU8XnZD9/IDtbMhHkda7T5t9tOlnDGLf54EO0Lz0/tzKRuJfrFfVyH40iOe9OZ
	FAT8mWjhgZxIRg4hz/NPsgpw4zY4gApWS/Guilc8dN85MIeomftzSGr2ep32h9R63au3
	L09otgxYhWhwoz+H7ZKHsW0osTVGBUAHdj0b9Vz1PRmLqHI/tQ0PKpkTyWLVZbpbXhnU
	35j5TdQGHZTlejb7ZAaQuBxRwh38uY5RZ5OFZ4ZBtZsoQF5WBK42ICq2Xar9J8M1ojhV
	ov0y7KqHbBJK0IilkigK1Iiwmhm6WbEWw735ubDrt8lq6oeG10Zb/W8SN3N7K502KCHv
	dzkw==
X-Gm-Message-State: APt69E1ufQVVfSCeNAiqyiJ4JSYzdVBWl6FARzXQvY6xURtFvSETRplo
	y/NVCVqo9L2pNu7BwMxZZZk=
X-Received: by 2002:ac8:23d4:: with SMTP id
	r20-v6mr2773538qtr.17.1528394822312; 
	Thu, 07 Jun 2018 11:07:02 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s15-v6sm26838414qtc.81.2018.06.07.11.06.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jun 2018 11:07:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  7 Jun 2018 15:06:38 -0300
Message-Id: <20180607180641.874-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180607180641.874-1-f4bug@amsat.org>
References: <20180607180641.874-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22b
Subject: [Qemu-arm] [PATCH v2 4/7] sdcard: Disable SEND_IF_COND (CMD8) for
 Spec v1
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Paul Brook <paul@codesourcery.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gjJdg44AF6tY

CMD8 is "Reserved" in Spec v1.10.

Spec v2.00 introduces the SEND_IF_COND command:

  6.4.1 Power Up

    CMD8 is newly added in the Physical Layer Specification Version
    2.00 to support multiple voltage ranges and used to check whether
    the card supports supplied voltage. The version 2.00 or later host
    shall issue CMD8 and verify voltage before card initialization.
    The host that does not support CMD8 shall supply high voltage range.

Message-Id: 201204252110.20873.paul@codesourcery.com
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 1ae085de69..3ec0f71f24 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1018,7 +1018,9 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 8:	/* CMD8:   SEND_IF_COND */
-        /* Physical Layer Specification Version 2.00 command */
+        if (sd->spec_version < SD_PHY_SPECv2_00_VERS) {
+            break;
+        }
         if (sd->state != sd_idle_state) {
             break;
         }
-- 
2.17.1

