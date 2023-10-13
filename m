Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1344649ejc;
        Fri, 13 Oct 2023 01:22:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFc/PadXOxmleb2DSFk/IHNYWNblkYbAp+Cpa9/XeFdqvDeSIAJkXmLzZ8HqpIvK6EISE2H
X-Received: by 2002:a05:620a:1a86:b0:773:bf62:b274 with SMTP id bl6-20020a05620a1a8600b00773bf62b274mr30527077qkb.61.1697185363177;
        Fri, 13 Oct 2023 01:22:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697185363; cv=none;
        d=google.com; s=arc-20160816;
        b=IMMnRDTKTMfIpmzZ8wwFEenMtkwMjHkiTh39I5Ou9uaCxkdeJmIEfuiqigt6IZjy7e
         drbucUi/V3BTt8nLRUP+etktiup6gyTcKcU/Xzh7Zqi7kHzJoX1NRcXEw7GH7Qk59Eeb
         w+QsOrzhvwlRI5Dia5CrZ+3IwUIAzK+HdhcDqb38KtKk2dnJXDqpNTCOmILOeKa+rYs3
         IjOp7+0oBQdB7Ym3g9jIRylcSYlSrmWEMs3oDfIJhytCpgikXuTWFJ7j4wPG0YwLz+LI
         IC1sUjTBo7PW8cgGOzQyfsoDPrOWMtyt4XnVGgeRruviFm2dEwd1/Xp17/MbH1lgUX6h
         nk6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nCbsT6AFnzVYF+57mPlA+zVrTDt7vf1WmOtihfcnrVs=;
        fh=vEc6xdiPYD5HsxhZp/3S9PASq1mZpGti05YxiVOdMLo=;
        b=iEwwsafESdE/HZzSSJnmYNdICDIueoBQrBfKIypFQFqElV24FakbkmF7njxWToXm95
         YOP6lLkMvAOVxaH94HYt1fataTZ1S76dwY1ezPBc4HFS2HBM8VMB93x05OXYAV52W3Ug
         uKRVHGXJmn0+A3YWYhqRyPeCJK/2bOB1b4aEmD/wmOcMSJpRsVmUoghT1b/HbW5I/Gia
         RHHrjDXqw+qHhhGikFTy/jcFRr2T2xehQF2KtkHhzMzDkN2fSKZGGvXYI5xKqMDcNrFI
         1DerxglfM+h7NG/M/GihjqS9E7D8z7pFRdpgHwtsfh4k2dtJ2MHtD6pgJ+chNeyc7s0y
         udaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H7S6tquu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d19-20020ac85ad3000000b00417d26b1222si842549qtd.476.2023.10.13.01.22.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 01:22:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H7S6tquu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrCwP-0004vz-UJ; Fri, 13 Oct 2023 03:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCwN-0004rf-1T
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:50:35 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCw9-0004SZ-M7
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:50:34 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-32d81864e3fso1522256f8f.2
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 00:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697183419; x=1697788219; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nCbsT6AFnzVYF+57mPlA+zVrTDt7vf1WmOtihfcnrVs=;
 b=H7S6tquuwjkCzzuPEPYJSbAbEg12X1E38/3939iRUkHAGtz88DlLCIdZhi94adbEVv
 su3tDowlPtgNTx/crGcWcu28UvH6tFUwDUBY+vnsOhdOQFSCNv6W9EoS9fvEoBcdmE0/
 0LoWTeUiKq5vEzmtF9rNpae9o90gdd8c3gm+lnnktKiaVePyPZElX0A/fGYxqU+TEwCO
 qpciKIQivLqcMyj8xLTRcR2Z6+c2sCHZJBZT2m+dRX/viTt6rpmUZwQcyrMRNYbx+aiY
 TDM1Q0YraVOn9rHRUgNFvWfxw8GPmXAO9Iw0T/RaNbWnalvOiMJzCMQ5Haim0D5XVjM5
 i7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697183419; x=1697788219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nCbsT6AFnzVYF+57mPlA+zVrTDt7vf1WmOtihfcnrVs=;
 b=i1vhjW5AJwaszFt7l0HqN5cZvNTvg1hvO3f8iq078Xz/ht5siyB/lparls99c92TXT
 3BOnbJP4f+6C0FbdSJS9SrK/UHZASm5NxxUjq7joLgGzhCM12m7wn5HBRjl9B6JWiuoE
 zI6io5MAKQ15o+mQVgI+xznuy2sLkYKtKmDAftCLSp/wiBCXln8BjuagyafSt73l89eg
 BhcYNBi62swaL07YCSLKnVqkXZLmIrohnSrKN0wM9CxfH2GiLEk/rEbfhvbueV5eoMnc
 BPYNgf2/h4+Az3/c8PKR2DA0arHwZRWIylIaxCvoGKb0G81j7TNNPsETGUJan2RmUsYp
 FtwQ==
X-Gm-Message-State: AOJu0YxJFJGxosFxM4uTWYjJt8LIy8SZZjHzQ2XjXNCO1oVynlRz4vMH
 H/dFM8BBHTrrkgZDSC1F0e7kmA==
X-Received: by 2002:a05:6000:80a:b0:32d:857c:d51c with SMTP id
 bt10-20020a056000080a00b0032d857cd51cmr7214301wrb.43.1697183419373; 
 Fri, 13 Oct 2023 00:50:19 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 m8-20020adfa3c8000000b0032d7fde2d3csm7990663wrb.79.2023.10.13.00.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:50:18 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [RFC PATCH 17/78] ui/sdl2.c: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 10:47:21 +0300
Message-Id: <b774031635094826bfc5e84f250763e4962683e8.1697183082.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bzdqbySKc+no

In preparation of raising -Wimplicit-fallthrough to 5, replace all
fall-through comments with the fallthrough attribute pseudo-keyword.

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 ui/sdl2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/sdl2.c b/ui/sdl2.c
index fbfdb64e90..3d157a14aa 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -576,78 +576,78 @@ static void handle_mousewheel(SDL_Event *ev)
 static void handle_windowevent(SDL_Event *ev)
 {
     struct sdl2_console *scon = get_scon_from_window(ev->window.windowID);
     bool allow_close = true;
 
     if (!scon) {
         return;
     }
 
     switch (ev->window.event) {
     case SDL_WINDOWEVENT_RESIZED:
         {
             QemuUIInfo info;
             memset(&info, 0, sizeof(info));
             info.width = ev->window.data1;
             info.height = ev->window.data2;
             dpy_set_ui_info(scon->dcl.con, &info, true);
         }
         sdl2_redraw(scon);
         break;
     case SDL_WINDOWEVENT_EXPOSED:
         sdl2_redraw(scon);
         break;
     case SDL_WINDOWEVENT_FOCUS_GAINED:
         win32_kbd_set_grab(gui_grab);
         if (qemu_console_is_graphic(scon->dcl.con)) {
             win32_kbd_set_window(sdl2_win32_get_hwnd(scon));
         }
-        /* fall through */
+        fallthrough;
     case SDL_WINDOWEVENT_ENTER:
         if (!gui_grab && (qemu_input_is_absolute(scon->dcl.con) || absolute_enabled)) {
             absolute_mouse_grab(scon);
         }
         /* If a new console window opened using a hotkey receives the
          * focus, SDL sends another KEYDOWN event to the new window,
          * closing the console window immediately after.
          *
          * Work around this by ignoring further hotkey events until a
          * key is released.
          */
         scon->ignore_hotkeys = get_mod_state();
         break;
     case SDL_WINDOWEVENT_FOCUS_LOST:
         if (qemu_console_is_graphic(scon->dcl.con)) {
             win32_kbd_set_window(NULL);
         }
         if (gui_grab && !gui_fullscreen) {
             sdl_grab_end(scon);
         }
         break;
     case SDL_WINDOWEVENT_RESTORED:
         update_displaychangelistener(&scon->dcl, GUI_REFRESH_INTERVAL_DEFAULT);
         break;
     case SDL_WINDOWEVENT_MINIMIZED:
         update_displaychangelistener(&scon->dcl, 500);
         break;
     case SDL_WINDOWEVENT_CLOSE:
         if (qemu_console_is_graphic(scon->dcl.con)) {
             if (scon->opts->has_window_close && !scon->opts->window_close) {
                 allow_close = false;
             }
             if (allow_close) {
                 shutdown_action = SHUTDOWN_ACTION_POWEROFF;
                 qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);
             }
         } else {
             SDL_HideWindow(scon->real_window);
             scon->hidden = true;
         }
         break;
     case SDL_WINDOWEVENT_SHOWN:
         scon->hidden = false;
         break;
     case SDL_WINDOWEVENT_HIDDEN:
         scon->hidden = true;
         break;
     }
 }
-- 
2.39.2

