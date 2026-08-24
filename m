Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399A0C5DF81
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 11:51:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyTDH-0004QN-8S; Mon, 24 Aug 2026 07:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sef1548@gmail.com>) id 1wyTDF-0004P3-Rf
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 07:51:37 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sef1548@gmail.com>) id 1wyTDD-0000iT-Bj
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 07:51:37 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-cbedbaba5fdso1944877a12.0
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 04:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787572293; x=1788177093; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=89PkCCpOw+bFLi7D2eR9te11PvgGH1BvJIB0HRSCKSg=;
 b=okQ9x1GS08u0vrsf4rYVl8KY/um95hLf7JWscDbVA638bnyPw02VI/1GoYZhvtIPS0
 tAtzU+OGYVII4Wsgx3tnFDhwwLsJ0+SUxAfdUxhwYBoGiXnsEJQ/XGq0ag4F/cldc3gh
 R+GmtIhSQsPups/PBtQ3hk4cRj+y+/QZwfJGuNoB/LrP5n8ITE0pGkMAFzuTQmEyOvAl
 hcP3zfG3Y1OskKyW1VBA2gPdR9r7oOvYD9TqTYQejGZcPzBAeD0TmJOZmPT3WXTSIyt4
 2u+CArHaFU1KR/O+RIVS8WUJb7TOAFAP/+QTaXhqQYEuLxnEXc82c77X3VpKP6WmU9Ca
 HagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787572293; x=1788177093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=89PkCCpOw+bFLi7D2eR9te11PvgGH1BvJIB0HRSCKSg=;
 b=nWSgAEngLSEcsahA0Y72QJyFVCVVwsmrr57E4RZB8fLpqGeARSqetGndPvtsgyZHjZ
 YiE52xQpD2P934hs0xL/cAADjxm65cSiClV6YLrg0KtVtNl9ZWP5Lv2mrXZYqb1qR7Uy
 BMGytkMY3zZF0jMwbzg0D1NMBwuLKE10e8vN71lDoAm+dlpKbyM3TmJgRS1HM223sDpD
 2ZPDzWbCNlvlRoaLUA4NAd3OuGb/MWHPc8yWMovEC4qHwK/Zd4/aiaP83PSXThLHjSp6
 9kLR9hAMl+wzBHLN1Hpp5+nidW9TEQ4zwEoKiC60eWDWyVe2tEkP+m6TxZVtnfgFjUP8
 1Bxg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoOgdX2/ujhg2Otb+vhaVOjghOak/L3McyYxiywKefDit/3K0Xgm9u7ieTWQHJ1CYXmtf4Gw8bOQg==@nongnu.org
X-Gm-Message-State: AFuF++kNWo7xGtHfnBk3FZQfodCh4CZ0dMEjF57OZGad3UYWNbBmfiCy
 6i3liyImYFsVWmot1FjXkXSFjJitouCrv5W54OzSdMyanrWjZkS8OXRj
X-Gm-Gg: AR+sD121xx1kyZHn41VzbX6IG1ztvhTKHEhCNObSUgg08/fvzhdIHytmZdTLhdmUEcZ
 lww1UHg3jPTCpS2+RseousFXuGjOc4FagKcH6ldYAGItko14+yRnxgRKViBPBR6sJQ8fBh2Z4Tv
 woFJgwf2Dgi49DX26pHqBDM8HnUlaDN5NPNkv1NYrOYWZuyuvjzZBpxLg8575E1A8TV8917s+sn
 q0cEgg0leH3IWl0edvYU5c/H/HPXmY7m3mZFlLQkTIaCjMxcJ9kBCELgIK+pqTi2CDyLGOlh/pd
 yttTGEt6karP4hnmtSOcLNGbQIovZY2VFh4IznaFbF0mBIJiOi9XVN9cCT3yoIWp3YYlfhNpbRb
 eyOOehqlHiALEae+HKT7kqlwkP7JQzVaaFCuwQVRx073uQbh6gry2HrUDqCKxOJHhojk1ZLJ7HH
 XnpDQYaTO+sx9R8SZ3nLi1onEdmBWz/lVh4XzTzM6KufoXO9eBmkxx85OcUYMRhyhLhlC3lOhTI
 kVeCE118hbXJSA/pN5j7F7pyhK+PDVieXnePqUiA9DtG7i5TwzzX/Eg6c+WgQjBbm5+jqhMQXpr
 l2GqZd+aBxnnqT0Ex954rafksmk=
X-Received: by 2002:a05:6a21:58b:b0:3c3:875d:7053 with SMTP id
 adf61e73a8af0-3cd2febf6c4mr48902664637.8.1787572293296; 
 Mon, 24 Aug 2026 04:51:33 -0700 (PDT)
Received: from nickhuang..
 (2001-b400-e2a6-81a4-7c3d-29c5-dd1d-e725.emome-ip6.hinet.net.
 [2001:b400:e2a6:81a4:7c3d:29c5:dd1d:e725])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cc199e4b1cbsm976400a12.19.2026.08.24.04.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2026 04:51:32 -0700 (PDT)
From: Nick Huang <sef1548@gmail.com>
To: wafgo01@gmail.com
Cc: bmeng.cn@gmail.com, farosas@suse.de, pbonzini@redhat.com,
 peter.maydell@linaro.org, philmd@mailo.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 00/14] hw/arm: add TI AM64x SoC and am64-virt
 machine
Date: Mon, 24 Aug 2026 11:51:23 +0000
Message-ID: <20260824115123.7089-1-sef1548@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820124824.618671-1-wafgo01@gmail.com>
References: <20260820124824.618671-1-wafgo01@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=sef1548@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Wadim,

Does the current version support booting the Linux kernel from
PROCESSOR-SDK-AM62X?

Thanks,
Nick

