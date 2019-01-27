Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2160176wrt;
        Sun, 27 Jan 2019 02:20:12 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4VgVOfmH5Km3WM9JY0IBHBYDaLGX9BFd+TC9loZDFsv4Er0bAWcKfwa81KKoJkZuPlThOe
X-Received: by 2002:a5d:6105:: with SMTP id v5mr17331603wrt.63.1548584412571;
        Sun, 27 Jan 2019 02:20:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548584412; cv=none;
        d=google.com; s=arc-20160816;
        b=FyjBuUTl+wGHUu8ASTJUb3qZOdwKlD+MGY/b6is7HSxkUvu3TGHCz6DFsFSfxw0pJU
         TwHBbVY0RcAZDKasYgGLx5fsBaFMU9NyY3FnsRRPFg/13hoM45lWMkIC0k4lQnkBUm0i
         n8VW4wbBDZqQwHHhG2P0UgBmtV5owLhrymmRBdVeS/gD8uma9VBJk6CKdbw6kbmJKea1
         TQ+dBuiyVbvhPWkeQAFbgz+H+z/o2AdBKYuPPlRPiGwIsAFBYe9fOzLbc8vlG0uuefm9
         pc/qgZvL80PhyeLoht/cEjjyzPW8kSEv2uCzGFWXPmLCo3NvVGRQEe+X/UQt7z5Eim2V
         xWzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=1LkqHkWFxYZLLQ5/6p+blvTeA+TrR597emoIx0TQLmE=;
        b=T8ZXJ2lG5l5wvDjx/uvznzdCG5oo/H4bEnjeGucrBl36ILJppFFpMyT1B4x04y6Uv0
         6RzJijNG4I5jhcBwashVORJVbP7KnFKaPZW+hFOXBC6p2VRUQnwFA+319KqfUfvVyp1N
         GJiIDU1ZLedfQlSr42moK4tZ/r2ILY0P99roxt6cyXfyNY5R89qSPcy0DHBSGxPuF9V8
         m+cIEypkg9UbnPi/fC5ahHK1Ymb7Nug5zAioPf9BuNW/R0nuo4xdJy1aUKsioqsYo8VL
         frt9IFdVPFAGrnfS6JaCUxEUHcYtGx2g+uXzreuaJ5nL4B4DFfegaXJchX1U7bH9Swfl
         KJ5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ha4xbtkP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p11si38080286wre.6.2019.01.27.02.20.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 27 Jan 2019 02:20:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ha4xbtkP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:43557 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gnhXv-0004by-MH
	for alex.bennee@linaro.org; Sun, 27 Jan 2019 05:20:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sourav.jb1988@gmail.com>) id 1gnhWd-00044u-Um
	for qemu-devel@nongnu.org; Sun, 27 Jan 2019 05:18:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sourav.jb1988@gmail.com>) id 1gnhWd-0008Ru-EC
	for qemu-devel@nongnu.org; Sun, 27 Jan 2019 05:18:51 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:43018)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sourav.jb1988@gmail.com>)
	id 1gnhWb-0008Q5-Sy; Sun, 27 Jan 2019 05:18:50 -0500
Received: by mail-pg1-x544.google.com with SMTP id v28so5983999pgk.10;
	Sun, 27 Jan 2019 02:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1LkqHkWFxYZLLQ5/6p+blvTeA+TrR597emoIx0TQLmE=;
	b=Ha4xbtkPY0fHRb3hDPPN0FKGGwtd2j1CmHYUHLq+lZXxBEH4MiEuiCanxvdzF7Hbff
	5fk4llMHowCrCe82NmbGrJvGW7gRmRNGKsraLaBA1WbWd+C4IyD4B+xOQjb0hdcEznI9
	6virEQn2ucmvsIg7mbnH3OZn4UM7iE2LhBineJ8PU7/aYnPCZ0MkwbGPQjGzVbfz1gWE
	fzZQRWjhX9hS7lufNr43qLqbRQ+ra8pOEVDw4nUebu9oPBsdFCeLrxvoUKsGbsfZ9yh5
	v7MIJUc3DHw+tTLcXphC4W/g7UMlnW5ed4LVXOeZWpWShWdo6laZ6Be/+VWB5GN8zM54
	JIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1LkqHkWFxYZLLQ5/6p+blvTeA+TrR597emoIx0TQLmE=;
	b=sZDvzIQMR2B59NsQ0dWOEnzJUAiulUCEwus+jpP7T/vM81k+zjLeznTiR5S63X3iBU
	5wcZG7+T42jEp05BatM+Je5QLL9ctFOHxEd0Cd6uS7B8ywIZEkelMwByOpwV72wMu2K3
	LuHR3HHE1j2D6jjoitol4FVfKAqMgwD8naxfsxSqrvTbgSvzbf4pZKmmORys1yLmLqP8
	XzIoMbhvugrL3tjdQ8IiKea9OnxmDJgPJ8KKJS+6RzF/IjFIQQ34Jk4snOye0Cu/h74S
	p9T/zdz20SWYvMlhXn+tv4HJv4vuRVbkoLhV1bQT0/m5yqe5YiNCBZJXg9UF54AswXLN
	Cqrw==
X-Gm-Message-State: AJcUukfouUMtoghHg2YEwQSwBR//x9YpnerGsmcIMajT9pM6XKZ2aHTm
	7k6GXFfbZ8v1nMHiLRvy5P4lfUpQZwg=
X-Received: by 2002:a62:7086:: with SMTP id l128mr17705200pfc.68.1548584327969;
	Sun, 27 Jan 2019 02:18:47 -0800 (PST)
Received: from localhost.localdomain ([27.7.213.28])
	by smtp.gmail.com with ESMTPSA id
	d6sm42723458pgc.89.2019.01.27.02.18.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Jan 2019 02:18:47 -0800 (PST)
From: kumar sourav <sourav.jb1988@gmail.com>
To: qemu-trivial@nongnu.org
Date: Sun, 27 Jan 2019 15:48:36 +0530
Message-Id: <20190127101836.15451-1-sourav.jb1988@gmail.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-devel] [PATCH] hw/input/lm832x: set device category of lm832x
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KHANrsDMu8oe

Sets the category of lm832x as DEVICE_CATEGORY_INPUT
Devices should be assigned to one of DEVICE_CATEGORY_XXXX

Signed-off-by: kumar sourav <sourav.jb1988@gmail.com>
---
 hw/input/lm832x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/input/lm832x.c b/hw/input/lm832x.c
index cffbf586d4..07ae5e0aee 100644
--- a/hw/input/lm832x.c
+++ b/hw/input/lm832x.c
@@ -509,6 +509,7 @@ static void lm8323_class_init(ObjectClass *klass, void *data)
     k->recv = lm_i2c_rx;
     k->send = lm_i2c_tx;
     dc->vmsd = &vmstate_lm_kbd;
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
 static const TypeInfo lm8323_info = {
-- 
2.17.1

