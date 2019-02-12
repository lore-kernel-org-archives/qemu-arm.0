Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp435807wrp;
        Mon, 11 Feb 2019 23:49:05 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYEgh88lPuxbXKVSW6YbWc8ce6TaP6clgnVOUajWrNMHWxPAj33AcVP8o+oZQBZfU5RdrTv
X-Received: by 2002:a25:35c4:: with SMTP id c187mr1706411yba.162.1549957745672;
        Mon, 11 Feb 2019 23:49:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549957745; cv=none;
        d=google.com; s=arc-20160816;
        b=jmNmqSmjYcPZV3yDeJMoPHszbyWwQTnFyIrXoa3AUyX1WKJb4s/7rbFyS+0KCHsXEE
         0hEuP6vcTcWeCqh6eS4NO0aY6DpKIO+vjfYpZGibsZlf2FuSLzZaiHB5giSNf5ITreQg
         Wl20gRWv9RZ8b21S5+ha+F+Q90G/CPCJKn6TbsUX6iXEtxq4rlZ+zRfA3xcRhCFEDj9n
         UsrCD+PWYmV1PQ60XYNnMCn2bFhIfUeTAGpUithBQEJ40MfLGbR3FUDnNnWSM3g2bXiw
         mB/DxdTIqkxUQI4nNZ7l95AIqq5Bf/kNWnhpaDbhq/ikJ9ZzKKonhU23wDBY4glww+Jt
         oQIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=RVjkhlEv9/QJh4Z54fOJrByEqVrLCXSGae7peXEvg1U=;
        b=dCRm3rEcL6GK8Y5+rPuGbemYhoZC8Z4D83pB+J+eLF7UzZKcSV8zE/xa4AN0NVnte0
         ytp8iWqMTGqLy1MFiDTtndxYAZzzELbIcgHQCdGvL51FJTyqe4Wg9R0NkQBySkCVO7/o
         47NlJATdIUuGDXp7UL/IRDCnqJXESSEhECG9G2VZ0lqztLfL1DjrT75ndmohn+CDOpSI
         Y6yT8gbHW9g1b59+4XJbWC6NV2+82+2O1CYczkICX1KMHcuB6HVy1f16jypLwdVTez8A
         9iEwazlGiW1jXuuWzi0cT3AIWaMKT3wtae75jmQV5z3RJ3ZX4oPAvsUhLZFq4FIWP9Zz
         sdtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gVu3FrvW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g65si7583148ywf.376.2019.02.11.23.49.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 23:49:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gVu3FrvW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35137 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtSoT-0004Eb-3N
	for alex.bennee@linaro.org; Tue, 12 Feb 2019 02:49:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46624)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtSoH-0004DN-15
	for qemu-arm@nongnu.org; Tue, 12 Feb 2019 02:48:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtSoE-0005vs-NK
	for qemu-arm@nongnu.org; Tue, 12 Feb 2019 02:48:52 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:34795)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtSoC-0005o7-Kf
	for qemu-arm@nongnu.org; Tue, 12 Feb 2019 02:48:50 -0500
Received: by mail-pl1-x642.google.com with SMTP id w4so917225plz.1
	for <qemu-arm@nongnu.org>; Mon, 11 Feb 2019 23:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=RVjkhlEv9/QJh4Z54fOJrByEqVrLCXSGae7peXEvg1U=;
	b=gVu3FrvWMoJyVLHDQoRRKTuR+Knl6kTXK81kKz1yFmFzZRn34+TFsjqzbTftMlkNx4
	WahSByu2FaKoGlElS/MhvvuAaf5hpJqkYp6Lyc1lXYvsIYrnZ30HpqraAsFFm7FnEpTJ
	JJjy/c5XJbZj+XtK/yBkJCadBPaIyVH5LxOAprRCOTRPJm2isXvUx8tG8JWvxPodZhQb
	SIMJrcWqgOW9J4dhV9Hc6X5/AqLkVgLf8fb3xbhY8KsZ+oP5KqWFsiFzQw71JuyAPKMb
	UhOSJUiPolSZhRe0NVsqtqGJQm4zng4q1V2FFLYTigazHYu8FOzsWV4fUdjHig/0GobQ
	T1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RVjkhlEv9/QJh4Z54fOJrByEqVrLCXSGae7peXEvg1U=;
	b=dlsJQbVA+9zEfFjlYmLqbadqHxENkDrq7Wl3qwBF/2yNKBzEj+QXPdHoJblsl2jDPb
	z510Xv9Xesp08j4/Vbq9l5igVNiHp328z3VjqrrU4h+unzyDgEFlHYQO0fR9peSptbPt
	m9XVOyeezhiwNh40IJt2GwXBCGTXXiVv+FkklzQNiwA7Ycs178+/JW1osQf5g1q68BLS
	No5NJxevWEZx+fZKEB/NmVEKhVCjGY0Y+YlCPlOms0dJR7GUf/1G3IWm1SONANwS1jdT
	sPv8FpS5qHDcztK88fOx7XTcn33fFcbV5TVjAi10GM0Iv+PutKuhJZH5QdIH0u6Zdebs
	GIHQ==
X-Gm-Message-State: AHQUAuabXONyasMDM3iCXi5dpsEmdPehrt3EKCxlolY6ZTv5yG5VZvV8
	n/S4K/2sLKNdJbD2E+SfpX8zoA==
X-Received: by 2002:a17:902:e612:: with SMTP id
	cm18mr2612419plb.172.1549957722148; 
	Mon, 11 Feb 2019 23:48:42 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	z62sm20975215pfi.4.2019.02.11.23.48.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 23:48:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 23:48:38 -0800
Message-Id: <20190212074840.13542-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-arm] [PATCH v2 0/2] linux-user: Fix AT_PLATFORM for arm
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
Cc: qemu-arm@nongnu.org, laurent@vivier.eu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WSXjy7TY6hNJ

With 5 minutes more thought I would have checked the values
that the 64-bit kernel supplies for arm32 in compat mode.
In the process I noticed that we don't get the right string
for arm64 in big-endian mode.


r~


Richard Henderson (2):
  linux-user: Add ELF_PLATFORM for arm
  linux-user: Fix ELF_PLATFORM for aarch64_be-linux-user

 linux-user/elfload.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

-- 
2.17.2

