Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp5501433lfc;
        Mon, 15 Feb 2021 02:32:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHlDAo4l0xEVOUOWKfUyQ5XZZfQ1NCa8LtwQ+7fyM9gBqXoDXnOjWqoDo5H8O+QxnBv51/
X-Received: by 2002:a5b:78f:: with SMTP id b15mr22526929ybq.234.1613385175774;
        Mon, 15 Feb 2021 02:32:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613385175; cv=none;
        d=google.com; s=arc-20160816;
        b=SrQ7/wc/sFZOjo2AO6N8nA5+JLXHiWyweA1qGh7X4T0CzUfP4/wEW78CJ7HbLbx/YM
         0sxPq1FCSIvybjmVT0UQMCu0N+I0jwbb+f+ImoZ81nKxlpQVPW5xVGkFkmPKyXZSbhp9
         VSwgYNWFE0AZfThs58NYLl7SpgWUr5DTpbIjKXe3CUqot9TfRZc3TaeoPnqtwfEJo7mV
         G7lShoP7JB7is2uAbgAC0hQ+l0TSEAXmpRz9jZkZMCAD85LdyNDVBuIzliRxRezQqv22
         ARzey9Pyx+AKGMqMUtamjf6fXAgMkrwjlYxQf5bRfMREauji5mfw3XC4Pr+8zoFyjIoy
         Cifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8Pn0+fUrgN1cOJcpBnEN8VL4IjMtADYNe+/RkpTUxHU=;
        b=LMABlpe7IaZ+Oxx1X8kUtnh4nNo9Q79822SM6xZ+NopEuUI2tBoZ49LBxEGRZjEFBG
         2NE5c42BhnILDGrOE1CZypnVnnumq9+trSh2/T42oWI7YXJVH2nCQdHNK6RNhDKu7diE
         df2FS6227SxuUciS6IdVZi6YU4oGzJeie4dKiew5wP41jynFq3QvpPP3Uxg2JdI2GBht
         fpFATIHKPrSSN0I76y6wHeXWlINEPAwU02CMf1k/iQRnPgWPfbLVTT7k7YN3lxaS3Qij
         DEoqN4hp3OaCLEdfZQGKP/S4H0kLQLsUMGR+AR2K4xaPEvu5wPBkSi1lQbV1iSYqPm0g
         cr7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r5trOF4x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5si17634027ybp.301.2021.02.15.02.32.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 02:32:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r5trOF4x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBbBW-0004Kj-K6
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 05:32:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbB3-0004Jd-MW
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 05:32:25 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBbAz-0001hz-QQ
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 05:32:25 -0500
Received: by mail-wr1-x431.google.com with SMTP id v1so8243458wrd.6
 for <qemu-arm@nongnu.org>; Mon, 15 Feb 2021 02:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Pn0+fUrgN1cOJcpBnEN8VL4IjMtADYNe+/RkpTUxHU=;
 b=r5trOF4xH7tJBTDZ4+nVU57V0qVY5k0jgPOn+V34UGgaOIWA1ec6z3k4c1Txa9HIIk
 Yb5s0ANl6Xolqt+A9f8kzTTI/lCVY5OXv9dvawjLxo92YY5LRDcAS3CWEQUygUg60pI1
 8PSOkg+bRUqO0T1fgl6N3WXnuRfUCqO3hm8s/l77HnplUkQOVdMIwwE7bwcnStb+oit4
 Vj+Uxb2XAQJfN2qp1XeEhc3G990pi8Gz3TnYS27jVg8S4wapUUosVlWF5LCMMt0bO3Qi
 QtuqO8nk7BbJ00tfmhjIu6rh96uDRiJvwK1eroklgU/ySE9U5UKCtK19HusMytBJ69FP
 E4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Pn0+fUrgN1cOJcpBnEN8VL4IjMtADYNe+/RkpTUxHU=;
 b=MV/dZKqGwNz9J2pjD7H3kdbPQjOoXKy2BMmJCuWY2pevLTRna9RGHSfSKb0pxYYcw7
 P/XVDxbUrw9aONBvKViGygqBCpC/Dj5CQyOsoih0pgDm8WDrzMw5dKTJ2JbGgWQslsGs
 OWsQEiyGSfVyn1mcTU1CsZd+q2GhSYJxLFaF1YpCx3QG3zR5uc95o5jw487Y69fjtZAN
 F2Or4mTUD3cQIiDXVzIDHdfZ3jocqD9k9jUl5sxKvH1T4Qk90nI2Z2ofoZ/MDQgYp06j
 E/RvVCd5y6CB0tL5UJ+jRaHxNcvbdOmS/swJgS3unzB1/Dwb+RXxe890StTP7vbU0J7R
 qPlw==
X-Gm-Message-State: AOAM5338e+F1rPFxZ3TEvbCVbX7VVBHGF+YttZNROzn9yd1UTtjTeFUY
 pnmQjdbUwfBfxwzivS9tefGh65ncMmH8UA==
X-Received: by 2002:a5d:5705:: with SMTP id a5mr14769676wrv.333.1613385140064; 
 Mon, 15 Feb 2021 02:32:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 36sm25196300wrj.97.2021.02.15.02.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 02:32:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/9] hw/display/tc6393xb: Expand out macros in template header
Date: Mon, 15 Feb 2021 10:32:09 +0000
Message-Id: <20210215103215.4944-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215103215.4944-1-peter.maydell@linaro.org>
References: <20210215103215.4944-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bqfk8o3kg7Ah

Now the template header is included only for BITS==32, expand
out all the macros that depended on the BITS setting.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/tc6393xb_template.h | 35 ++++------------------------------
 1 file changed, 4 insertions(+), 31 deletions(-)

diff --git a/hw/display/tc6393xb_template.h b/hw/display/tc6393xb_template.h
index 78629c07f97..7789ffc4399 100644
--- a/hw/display/tc6393xb_template.h
+++ b/hw/display/tc6393xb_template.h
@@ -21,25 +21,7 @@
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#if BITS == 8
-# define SET_PIXEL(addr, color)  (*(uint8_t *)addr = color)
-#elif BITS == 15 || BITS == 16
-# define SET_PIXEL(addr, color)  (*(uint16_t *)addr = color)
-#elif BITS == 24
-# define SET_PIXEL(addr, color)  \
-    do {                         \
-        addr[0] = color;         \
-        addr[1] = (color) >> 8;  \
-        addr[2] = (color) >> 16; \
-    } while (0)
-#elif BITS == 32
-# define SET_PIXEL(addr, color)  (*(uint32_t *)addr = color)
-#else
-# error unknown bit depth
-#endif
-
-
-static void glue(tc6393xb_draw_graphic, BITS)(TC6393xbState *s)
+static void tc6393xb_draw_graphic32(TC6393xbState *s)
 {
     DisplaySurface *surface = qemu_console_surface(s->con);
     int i;
@@ -49,24 +31,15 @@ static void glue(tc6393xb_draw_graphic, BITS)(TC6393xbState *s)
     data_buffer = s->vram_ptr;
     data_display = surface_data(surface);
     for(i = 0; i < s->scr_height; i++) {
-#if (BITS == 16)
-        memcpy(data_display, data_buffer, s->scr_width * 2);
-        data_buffer += s->scr_width;
-        data_display += surface_stride(surface);
-#else
         int j;
-        for (j = 0; j < s->scr_width; j++, data_display += BITS / 8, data_buffer++) {
+        for (j = 0; j < s->scr_width; j++, data_display += 4, data_buffer++) {
             uint16_t color = *data_buffer;
-            uint32_t dest_color = glue(rgb_to_pixel, BITS)(
+            uint32_t dest_color = rgb_to_pixel32(
                            ((color & 0xf800) * 0x108) >> 11,
                            ((color & 0x7e0) * 0x41) >> 9,
                            ((color & 0x1f) * 0x21) >> 2
                            );
-            SET_PIXEL(data_display, dest_color);
+            *(uint32_t *)data_display = dest_color;
         }
-#endif
     }
 }
-
-#undef BITS
-#undef SET_PIXEL
-- 
2.20.1

