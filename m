Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp937475ejg;
        Fri, 19 Jan 2024 05:24:51 -0800 (PST)
X-Received: by 2002:a2e:8548:0:b0:2cd:1b40:5725 with SMTP id u8-20020a2e8548000000b002cd1b405725mr762533ljj.212.1705670691153;
        Fri, 19 Jan 2024 05:24:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705670691; cv=none;
        d=google.com; s=arc-20160816;
        b=uHnLR7rIV4kr9Sf/GtbzTrZtaDAKiis82MZ3/RPm5a2mCF79dZlAD8BCQYrYDTEmfL
         e2Zk3fjz1MiADWpqdfcfSxtwXXc+sL56WiWCY90yJgmnm3YtNXHfNfYJv1mcijDCBS4L
         CuYxEk1/ve7Xsq8C6eHs8GQEHi9+oIhUXASQa50vFz+HnvFrrxvDY1xNY9Nqc5HafE3c
         y/L1gAEg3lGISIIvkMwchkedUx/g5AKapbu0xNmbjgRRk4HeprkvkS2znIuEGty1Cp2/
         gb6X+XAf4ce8PpEdTqB2GK12TWbEEYolob96j0PZIKKCjnkKn9Kzvb05FrTxbcN9ubUV
         yCuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=+T8RIOEQPRcMJZsgbLWxYT1ca7xyW1DLwtPR8phAymY=;
        fh=2YMDnQ3SxoZ0TW62CmU2DrPnMMetFtoAQMKRN2o0WyY=;
        b=vJ7mHKzCKFWQQe7+mPzJ7HxN7NzO9pFYURu6QUKOiekPW/sUDJr7GDY8Ps00rsCAsH
         hGIukOnv5bjz0ftoP0Yvay+J0QOehnJB8/VX9jds5wOvZOzqnPx+bBLDXJ38wVJeBd+j
         sCK7s4HryqVEQJM9Q9BrMHDfWCMsv1+VtGmHzVe+bN2nm9NUHx7k6J9zRdx0ULOea1ev
         80W/7JFlVw3onC6hlnuvVvEi11aa4XKSeqJiYian1xzJ+shlIinhYz53KctZsTDwa9Is
         MR3KjbqtK0utnoJ7J/09Kdd+AxuBVhB613kNZGIOLEHBT7j3FxZvmJynvIm7CDriQjxS
         t+3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="BD/7X50D";
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b18-20020aa7df92000000b0055a650f23d1sor228280edy.9.2024.01.19.05.24.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jan 2024 05:24:51 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="BD/7X50D";
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705670691; x=1706275491; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+T8RIOEQPRcMJZsgbLWxYT1ca7xyW1DLwtPR8phAymY=;
        b=BD/7X50DfjY8TLQiiQyGIWCULurvVRfEwP4f1A+L31Ke/P5NOyac4x5OMYBVB75Ua4
         MEXTSUcinPvdO6zdUm+g3sO9hqbf3QxfVLWGAzW+RxszSqkFpbXdF1vJfhJ6X2J9mJjR
         sgBrFaaPdxIHnNxW72tyCCGD6I36+CmdFZA9eoEnvDZTXBTBPaZkTp1uVa5REySt78Iu
         nPV7+oMOrWuYL1rhIjt/RTge7HIkOMtb4lXy4UcoOQU2s9vAZAtQmM77z3YFrt7rJNjV
         6SevVokcQx0mkPyOtF2XZDnFRtKexWhwKGeSYT2k5+RWDoBTElIf1YNULiVNd57kIje9
         telQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705670691; x=1706275491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+T8RIOEQPRcMJZsgbLWxYT1ca7xyW1DLwtPR8phAymY=;
        b=OZrD7/OK/C1tEbp9hqjWJjs0O3vLTWJLziehGngh/d9DcRm6P0l0zJpm8kjzMfq+n7
         K5SuBcyRPs7D2FRjVBm2cpBnYsqyDcdbCgi8mNwjX4LwcMP7XXXJ00zGW2/cWBXl6EYk
         Hrw4X2lQ4ovpQBZ9iQMEI2LoRVSCBlyzLHJ+FE/W9Bw1b4/twrp3s2Scd019rZhDyNgV
         oyuP+nYQJKOzMjDIqj4VpDrSkTgyp6Yl3A/otswYs790l1m5aiJNLYRx5uNrZ4Wx7l1A
         21p8Tlkf20bKQKjuq0kwly+4UFr5zyiCLj6Lx4+fuxZ1OOjb5pRqszjRwLiDV/ZL8Yr6
         zvHw==
X-Gm-Message-State: AOJu0YxG/wRLPFauiNaQZ2OIf3t0UiIb5Xjbfbt0JCSpD9wkDawOW+5U
	0QEaPX4EY4YSsW4z0axPZRwyS89DTXqu2apCWf0EQwst6hb7WHVgfZ50mVntrjSe1A==
X-Google-Smtp-Source: AGHT+IH02j12TkkwJ+aVLwll6KgcW8NdLsxmRj8ev6W7H46ZVDEqtXSkiGJYs48zLMSDy+bkv6JCrw==
X-Received: by 2002:a50:ec99:0:b0:559:4f8:36a9 with SMTP id e25-20020a50ec99000000b0055904f836a9mr720444edr.11.1705670690707;
        Fri, 19 Jan 2024 05:24:50 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from localhost.localdomain (adsl-138.37.6.1.tellas.gr. [37.6.1.138])
        by smtp.gmail.com with ESMTPSA id b11-20020aa7dc0b000000b00558fc426affsm8568310edu.88.2024.01.19.05.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 05:24:50 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 0/5] hw/{arm,xen} convert printfs to trace/reports
Date: Fri, 19 Jan 2024 15:24:42 +0200
Message-Id: <cover.1705670342.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
X-TUID: SuiAk/vJpX1n

This series changes some printfs to use the trace event framework. 
Additionally, it converts some error/warning reporting fprintfs to 
error_report/warn_report.

Differences from v1 
<cover.1705662313.git.manos.pitsidianakis@linaro.org>:
    - addressed Alex's review

Manos Pitsidianakis (5):
  hw/arm/z2: convert DPRINTF to trace events and guest errors
  hw/arm/xen_arm.c: convert DPRINTF to trace events and error/warn
    reports
  hw/xen/xen-mapcache.c: convert DPRINTF to tracepoints
  hw/xen/xen-hvm-common.c: convert DPRINTF to tracepoints
  hw/xen: convert stderr prints to error/warn reports

 hw/arm/strongarm.c      | 55 +++++++++++++++++++-------------------
 hw/arm/trace-events     | 15 +++++++++++
 hw/arm/xen_arm.c        | 23 ++++++++--------
 hw/arm/z2.c             | 27 ++++++-------------
 hw/xen/trace-events     | 21 ++++++++++++++-
 hw/xen/xen-hvm-common.c | 47 ++++++++++++++++----------------
 hw/xen/xen-mapcache.c   | 59 ++++++++++++++++++-----------------------
 7 files changed, 131 insertions(+), 116 deletions(-)

Range-diff against v1:
1:  021405f5ef < -:  ---------- hw/arm/z2: convert DPRINTF to tracepoints
2:  3c6fbd73a1 ! 1:  339219e962 hw/arm/strongarm.c: convert DPRINTF to tracepoints
    @@ Metadata
     Author: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
     
      ## Commit message ##
    -    hw/arm/strongarm.c: convert DPRINTF to tracepoints
    +    hw/arm/z2: convert DPRINTF to trace events and guest errors
     
         Tracing DPRINTFs to stderr might not be desired. A developer that relies
    -    on tracepoints should be able to opt-in to each tracepoint and rely on
    +    on trace events should be able to opt-in to each trace event and rely on
         QEMU's log redirection, instead of stderr by default.
     
         This commit converts DPRINTFs in this file that are used for tracing
    -    into tracepoints.
    +    into trace events. DPRINTFs that report guest errors are logged with
    +    LOG_GUEST_ERROR.
     
         Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
     
    @@ hw/arm/strongarm.c: static uint64_t strongarm_pic_mem_read(void *opaque, hwaddr
          default:
     -        printf("%s: Bad register offset 0x" HWADDR_FMT_plx "\n",
     -                        __func__, offset);
    -+        trace_strongarm_pic_mem_read(offset);
    ++        qemu_log_mask(LOG_GUEST_ERROR,
    ++                      "Bad pic mem register read offset 0x%zu",
    ++                      offset);
              return 0;
          }
      }
    @@ hw/arm/strongarm.c: static void strongarm_pic_mem_write(void *opaque, hwaddr off
          default:
     -        printf("%s: Bad register offset 0x" HWADDR_FMT_plx "\n",
     -                        __func__, offset);
    -+        trace_strongarm_pic_mem_write(offset);
    ++        qemu_log_mask(LOG_GUEST_ERROR,
    ++                     "Bad pic mem register write offset 0x%zu",
    ++                      offset);
              break;
          }
          strongarm_pic_update(s);
    @@ hw/arm/strongarm.c: static uint64_t strongarm_rtc_read(void *opaque, hwaddr addr
                      (1000 * ((s->rttr & 0xffff) + 1));
          default:
     -        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr);
    -+        trace_strongarm_rtc_read(addr);
    ++        qemu_log_mask(LOG_GUEST_ERROR, "Bad rtc register read 0x%zu", addr);
              return 0;
          }
      }
    @@ hw/arm/strongarm.c: static void strongarm_rtc_write(void *opaque, hwaddr addr,
      
          default:
     -        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr);
    -+        trace_strongarm_rtc_write(addr);
    ++        qemu_log_mask(LOG_GUEST_ERROR, "Bad rtc register write 0x%zu", addr);
          }
      }
      
    @@ hw/arm/strongarm.c: static uint64_t strongarm_gpio_read(void *opaque, hwaddr off
      
          default:
     -        printf("%s: Bad offset 0x" HWADDR_FMT_plx "\n", __func__, offset);
    -+        trace_strongarm_gpio_read(offset);
    ++        qemu_log_mask(LOG_GUEST_ERROR, "Bad gpio read offset 0x%zu", offset);
          }
      
          return 0;
    @@ hw/arm/strongarm.c: static void strongarm_gpio_write(void *opaque, hwaddr offset
      
          default:
     -        printf("%s: Bad offset 0x" HWADDR_FMT_plx "\n", __func__, offset);
    -+        trace_strongarm_gpio_write(offset);
    ++        qemu_log_mask(LOG_GUEST_ERROR, "Bad gpio write offset 0x%zu", offset);
          }
      }
      
    @@ hw/arm/strongarm.c: static uint64_t strongarm_ppc_read(void *opaque, hwaddr offs
      
          default:
     -        printf("%s: Bad offset 0x" HWADDR_FMT_plx "\n", __func__, offset);
    -+        trace_strongarm_ppc_read(offset);
    ++        qemu_log_mask(LOG_GUEST_ERROR, "Bad ppc read offset 0x%zu", offset);
          }
      
          return 0;
    @@ hw/arm/strongarm.c: static void strongarm_ppc_write(void *opaque, hwaddr offset,
      
          default:
     -        printf("%s: Bad offset 0x" HWADDR_FMT_plx "\n", __func__, offset);
    -+        trace_strongarm_ppc_write(offset);
    ++        qemu_log_mask(LOG_GUEST_ERROR, "Bad ppc write offset 0x%zu", offset);
          }
      }
      
    @@ hw/arm/strongarm.c: static uint64_t strongarm_uart_read(void *opaque, hwaddr add
      
          default:
     -        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr);
    -+        trace_strongarm_uart_read_bad_register(addr);
    ++        qemu_log_mask(LOG_GUEST_ERROR, "Bad uart register read 0x%zu", addr);
              return 0;
          }
      }
    @@ hw/arm/strongarm.c: static void strongarm_uart_write(void *opaque, hwaddr addr,
      
          default:
     -        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr);
    -+        trace_strongarm_uart_write_bad_register(addr);
    ++        qemu_log_mask(LOG_GUEST_ERROR, "Bad uart register write 0x%zu", addr);
          }
      }
      
    @@ hw/arm/strongarm.c: static uint64_t strongarm_ssp_read(void *opaque, hwaddr addr
              return retval;
          default:
     -        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr);
    -+        trace_strongarm_ssp_read(addr);
    ++        qemu_log_mask(LOG_GUEST_ERROR, "Bad ssp register read 0x%zu", addr);
              break;
          }
          return 0;
    @@ hw/arm/strongarm.c: static void strongarm_ssp_write(void *opaque, hwaddr addr,
              if ((s->sscr[0] & SSCR0_SSE) && SSCR0_DSS(value) < 4) {
     -            printf("%s: Wrong data size: %i bits\n", __func__,
     -                   (int)SSCR0_DSS(value));
    -+            trace_strongarm_ssp_write_wrong_data_size((int)SSCR0_DSS(value));
    ++            qemu_log_mask(LOG_GUEST_ERROR,
    ++                          "Wrong data size: %i bits",
    ++                          (int)SSCR0_DSS(value));
              }
              if (!(value & SSCR0_SSE)) {
                  s->sssr = 0;
    @@ hw/arm/strongarm.c: static void strongarm_ssp_write(void *opaque, hwaddr addr,
              s->sscr[1] = value & 0x2f;
              if (value & SSCR1_LBM) {
     -            printf("%s: Attempt to use SSP LBM mode\n", __func__);
    -+            trace_strongarm_ssp_write_wrong_data_size_invalid();
    ++            qemu_log_mask(LOG_GUEST_ERROR, "Attempt to use SSP LBM mode");
              }
              strongarm_ssp_fifo_update(s);
              break;
    @@ hw/arm/strongarm.c: static void strongarm_ssp_write(void *opaque, hwaddr addr,
      
          default:
     -        printf("%s: Bad register 0x" HWADDR_FMT_plx "\n", __func__, addr);
    -+        trace_strongarm_ssp_write_bad_register(addr);
    ++        qemu_log_mask(LOG_GUEST_ERROR, "Bad ssp register write 0x%zu", addr);
              break;
          }
      }
     
      ## hw/arm/trace-events ##
    -@@ hw/arm/trace-events: z2_lcd_invalid_command(uint8_t value) "0x%x"
    - z2_aer915_send_too_log(int8_t msg) "message too long (%i bytes)"
    - z2_aer915_send(uint8_t reg, uint8_t value) "reg %d value 0x%02x"
    - z2_aer915_i2c_start_recv(uint16_t len) "I2C_START_RECV: short message with len %d"
    +@@ hw/arm/trace-events: smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s
    + smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
    + smmuv3_inv_notifiers_iova(const char *name, uint16_t asid, uint16_t vmid, uint64_t iova, uint8_t tg, uint64_t num_pages) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64
    + 
    ++# z2.c
    ++z2_lcd_reg_update(uint8_t cur, uint8_t _0, uint8_t _1, uint8_t _2, uint32_t value) "cur_reg = 0x%xd, buf = [0x%xd, 0x%xd, 0x%xd], value = 0x%x"
    ++z2_lcd_enable_disable_result(const char * result) "LCD %s"
    ++z2_aer915_send_too_long(int8_t msg) "message too long (%i bytes)"
    ++z2_aer915_send(uint8_t reg, uint8_t value) "reg %d value 0x%02x"
    ++z2_aer915_event(int8_t event, int8_t len) "i2c event =0x%x len=%d bytes"
     +
     +# strongarm.c
     +strongarm_uart_update_parameters(const char *label, int speed, char parity, int data_bits, int stop_bits) "%s speed=%d parity=%c data=%d stop=%d"
    -+strongarm_uart_read_bad_register(uint64_t addr) "Bad uart register 0x%zu"
    -+strongarm_uart_write_bad_register(uint64_t addr) "Bad uart register 0x%zu"
    -+strongarm_pic_mem_read(uint64_t offset) "Bad pic mem register read offset 0x%zu"
    -+strongarm_pic_mem_write(uint64_t offset) "Bad pic mem register write offset 0x%zu"
    -+strongarm_rtc_read(uint64_t addr) "Bad rtc register read 0x%zu"
    -+strongarm_rtc_write(uint64_t addr) "Bad rtc register write 0x%zu"
    -+strongarm_gpio_read(uint64_t offset) "Bad gpio read offset 0x%zu"
    -+strongarm_gpio_write(uint64_t offset) "Bad gpio write offset 0x%zu"
    -+strongarm_ppc_write(uint64_t offset) "Bad ppc write offset 0x%zu"
    -+strongarm_ppc_read(uint64_t offset) "Bad ppc write offset 0x%zu"
    -+strongarm_ssp_read_underrun(void) "SSP Rx Underrun"
    -+strongarm_ssp_read(uint64_t addr) "Bad register 0x%zu"
    -+strongarm_ssp_write_wrong_data_size(int v) "Wrong data size: %i bits"
    -+strongarm_ssp_write_wrong_data_size_invalid(void) "Attempt to use SSP LBM mode"
    -+strongarm_ssp_write_bad_register(uint64_t addr) "Bad register 0x%zu"
    ++strongarm_ssp_read_underrun(void) "SSP rx underrun"
    +
    + ## hw/arm/z2.c ##
    +@@
    + #include "cpu.h"
    + #include "qom/object.h"
    + #include "qapi/error.h"
    +-
    +-#ifdef DEBUG_Z2
    +-#define DPRINTF(fmt, ...) \
    +-        printf(fmt, ## __VA_ARGS__)
    +-#else
    +-#define DPRINTF(fmt, ...)
    +-#endif
    ++#include "trace.h"
    + 
    + static const struct keymap map[0x100] = {
    +     [0 ... 0xff] = { -1, -1 },
    +@@ hw/arm/z2.c: static uint32_t zipit_lcd_transfer(SSIPeripheral *dev, uint32_t value)
    + {
    +     ZipitLCD *z = ZIPIT_LCD(dev);
    +     uint16_t val;
    ++
    ++    trace_z2_lcd_reg_update(z->cur_reg, z->buf[0], z->buf[1], z->buf[2], value);
    +     if (z->selected) {
    +         z->buf[z->pos] = value & 0xff;
    +         z->pos++;
    +@@ hw/arm/z2.c: static uint32_t zipit_lcd_transfer(SSIPeripheral *dev, uint32_t value)
    +     if (z->pos == 3) {
    +         switch (z->buf[0]) {
    +         case 0x74:
    +-            DPRINTF("%s: reg: 0x%.2x\n", __func__, z->buf[2]);
    +             z->cur_reg = z->buf[2];
    +             break;
    +         case 0x76:
    +             val = z->buf[1] << 8 | z->buf[2];
    +-            DPRINTF("%s: value: 0x%.4x\n", __func__, val);
    +             if (z->cur_reg == 0x22 && val == 0x0000) {
    +                 z->enabled = 1;
    +-                printf("%s: LCD enabled\n", __func__);
    ++                trace_z2_lcd_enable_disable_result("enabled");
    +             } else if (z->cur_reg == 0x10 && val == 0x0000) {
    +                 z->enabled = 0;
    +-                printf("%s: LCD disabled\n", __func__);
    ++                trace_z2_lcd_enable_disable_result("disabled");
    +             }
    +             break;
    +         default:
    +-            DPRINTF("%s: unknown command!\n", __func__);
    +             break;
    +         }
    +         z->pos = 0;
    +@@ hw/arm/z2.c: static int aer915_send(I2CSlave *i2c, uint8_t data)
    + 
    +     s->buf[s->len] = data;
    +     if (s->len++ > 2) {
    +-        DPRINTF("%s: message too long (%i bytes)\n",
    +-            __func__, s->len);
    ++        trace_z2_aer915_send_too_long(s->len);
    +         return 1;
    +     }
    + 
    +     if (s->len == 2) {
    +-        DPRINTF("%s: reg %d value 0x%02x\n", __func__,
    +-                s->buf[0], s->buf[1]);
    ++        trace_z2_aer915_send(s->buf[0], s->buf[1]);
    +     }
    + 
    +     return 0;
    +@@ hw/arm/z2.c: static int aer915_event(I2CSlave *i2c, enum i2c_event event)
    + {
    +     AER915State *s = AER915(i2c);
    + 
    ++    trace_z2_aer915_event(s->len, event);
    +     switch (event) {
    +     case I2C_START_SEND:
    +         s->len = 0;
    +         break;
    +     case I2C_START_RECV:
    +-        if (s->len != 1) {
    +-            DPRINTF("%s: short message!?\n", __func__);
    +-        }
    +         break;
    +     case I2C_FINISH:
    +         break;
3:  49905a0d22 ! 2:  c7eb8943f0 hw/arm/xen_arm.c: replace DPRINTF with traces
    @@ Metadata
     Author: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
     
      ## Commit message ##
    -    hw/arm/xen_arm.c: replace DPRINTF with traces
    +    hw/arm/xen_arm.c: convert DPRINTF to trace events and error/warn reports
    +
    +    Tracing DPRINTFs to stderr might not be desired. A developer that relies
    +    on trace events should be able to opt-in to each trace event and rely on
    +    QEMU's log redirection, instead of stderr by default.
    +
    +    This commit converts DPRINTFs in this file that are used for tracing
    +    into trace events. Errors or warnings are converted to error_report and
    +    warn_report calls.
     
         Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
     
      ## hw/arm/trace-events ##
    -@@ hw/arm/trace-events: strongarm_ssp_read(uint64_t addr) "Bad register 0x%zu"
    - strongarm_ssp_write_wrong_data_size(int v) "Wrong data size: %i bits"
    - strongarm_ssp_write_wrong_data_size_invalid(void) "Attempt to use SSP LBM mode"
    - strongarm_ssp_write_bad_register(uint64_t addr) "Bad register 0x%zu"
    +@@ hw/arm/trace-events: z2_aer915_event(int8_t event, int8_t len) "i2c event =0x%x len=%d bytes"
    + # strongarm.c
    + strongarm_uart_update_parameters(const char *label, int speed, char parity, int data_bits, int stop_bits) "%s speed=%d parity=%c data=%d stop=%d"
    + strongarm_ssp_read_underrun(void) "SSP rx underrun"
     +
     +# xen_arm.c
     +xen_create_virtio_mmio_devices(int i, int irq, uint64_t base) "Created virtio-mmio device %d: irq %d base 0x%lx"
    -+xen_init_ram(const char *hi_xor_low, uint64_t base, uint64_t size) "Initialized region xen.ram.%s: base 0x%lx size 0x%lx"
    -+xen_enable_tpm_not_found(void) "Couldn't find tmp0 backend"
    ++xen_init_ram(uint64_t machine_ram_size) "Initialized xen ram with size 0x%lx"
     +xen_enable_tpm(uint64_t addr) "Connected tpmdev at address 0x%lx"
    -+xen_arm_init(const char *msg) "%s"
     
      ## hw/arm/xen_arm.c ##
     @@
    @@ hw/arm/xen_arm.c: static void xen_create_virtio_mmio_devices(XenArmState *xam)
      }
      
     @@ hw/arm/xen_arm.c: static void xen_init_ram(MachineState *machine)
    +     MemoryRegion *sysmem = get_system_memory();
    +     ram_addr_t block_len, ram_size[GUEST_RAM_BANKS];
    + 
    ++    trace_xen_init_ram(machine->ram_size);
    +     if (machine->ram_size <= GUEST_RAM0_SIZE) {
    +         ram_size[0] = machine->ram_size;
    +         ram_size[1] = 0;
    +@@ hw/arm/xen_arm.c: static void xen_init_ram(MachineState *machine)
          memory_region_init_alias(&ram_lo, NULL, "xen.ram.lo", &ram_memory,
                                   GUEST_RAM0_BASE, ram_size[0]);
          memory_region_add_subregion(sysmem, GUEST_RAM0_BASE, &ram_lo);
     -    DPRINTF("Initialized region xen.ram.lo: base 0x%llx size 0x%lx\n",
     -            GUEST_RAM0_BASE, ram_size[0]);
    -+    trace_xen_init_ram("lo", GUEST_RAM0_BASE, ram_size[0]);
    - 
    +-
          if (ram_size[1] > 0) {
              memory_region_init_alias(&ram_hi, NULL, "xen.ram.hi", &ram_memory,
                                       GUEST_RAM1_BASE, ram_size[1]);
              memory_region_add_subregion(sysmem, GUEST_RAM1_BASE, &ram_hi);
     -        DPRINTF("Initialized region xen.ram.hi: base 0x%llx size 0x%lx\n",
     -                GUEST_RAM1_BASE, ram_size[1]);
    -+        trace_xen_init_ram("hi", GUEST_RAM1_BASE, ram_size[1]);
          }
      }
      
    @@ hw/arm/xen_arm.c: static void xen_enable_tpm(XenArmState *xam)
          TPMBackend *be = qemu_find_tpm_be("tpm0");
          if (be == NULL) {
     -        DPRINTF("Couldn't fine the backend for tpm0\n");
    -+        trace_xen_enable_tpm_not_found();
    ++        error_report("Couldn't find tmp0 backend");
              return;
          }
          dev = qdev_new(TYPE_TPM_TIS_SYSBUS);
    @@ hw/arm/xen_arm.c: static void xen_arm_init(MachineState *machine)
          if (machine->ram_size == 0) {
     -        DPRINTF("ram_size not specified. QEMU machine started without IOREQ"
     -                "(no emulated devices including Virtio)\n");
    -+        trace_xen_arm_init("ram_size not specified. "
    -+                           "QEMU machine started "
    -+                           "without IOREQ "
    -+                           "(no emulated devices"
    -+                           "including Virtio)");
    ++        warn_report("%s non-zero ram size not specified. QEMU machine started"
    ++                    " without IOREQ (no emulated devices including virtio)",
    ++                    MACHINE_CLASS(object_get_class(OBJECT(machine)))->desc);
              return;
          }
      
    @@ hw/arm/xen_arm.c: static void xen_arm_init(MachineState *machine)
              xen_enable_tpm(xam);
          } else {
     -        DPRINTF("tpm-base-addr is not provided. TPM will not be enabled\n");
    -+        trace_xen_arm_init("tpm-base-addr is not provided."
    -+                           "TPM will not be enabled");
    ++        warn_report("tpm-base-addr is not provided. TPM will not be enabled");
          }
      #endif
      }
4:  c5c74aadad = 3:  d5493e864f hw/xen/xen-mapcache.c: convert DPRINTF to tracepoints
5:  d1f96a077b = 4:  651ad62da1 hw/xen/xen-hvm-common.c: convert DPRINTF to tracepoints
6:  a741c52584 = 5:  bf55043690 hw/xen: convert stderr prints to error/warn reports

base-commit: d0f4aa7d50d485b1fb5ec8ab6f934e5df852ab07
-- 
γαῖα πυρί μιχθήτω
