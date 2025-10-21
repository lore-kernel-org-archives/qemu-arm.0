Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E79BCCD184
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Oct 2025 14:39:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBDVu-0002Ei-Qg; Tue, 21 Oct 2025 10:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBDVk-0002E8-3G
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 10:38:53 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBDVg-0005aX-Ox
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 10:38:51 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-421851bcb25so3359632f8f.2
 for <qemu-arm@nongnu.org>; Tue, 21 Oct 2025 07:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761057526; x=1761662326; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nvfb6jgM7jLFSk3JMWS/e7n86t42/AC+DtEAZZ2VMO4=;
 b=SHif4l9lzf650H/VsESsUwuAgSCp8owRW9SS5Z7j9N5AxCuvhb7aAvP86Faj6yYh2K
 mtPDkkDoxyeg2ITL+sGOqj/l8XL2w02vl8vKjNqSWKTfAGU8LcmjJVfVjBneGn3XxDsJ
 Il50dAJvg15BioL5ZDVDudUpAvRJiOZAs78/CuKCXTGCC1ZsRBLsVIoxcYm+3l/xk/0C
 deWFeUwrzG7mU3hwA2wyK9/QgG+n19fZ/UYkQylzhumpjmUfXTRTcRTFuck7WCUqukrb
 HVvacN9nTd5A91EN+mDfuF45j4GorWJlmy8egO4Mhn2oRFbmUvDjRfrBY95D+L/vBvZC
 uZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761057526; x=1761662326;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nvfb6jgM7jLFSk3JMWS/e7n86t42/AC+DtEAZZ2VMO4=;
 b=JZq+IrUaktpKAruoCXtiz1xiLwhRCz4Z5SzNdt9T+cv+Au2HgxeJyb/m9Cz/vPcGHz
 DxLBrCm10sf9n/9yLtAQiv7YFyr7LTpZwgelJoq/W4pBF98X9Z/yp3uK6mBTpkfIz3sk
 YkEaGa9dVKQuXrv8sqTztYW7cr/X/AggKsyJtHOaMdhDsqG9OsI17Hge4sXVFfZuMHzt
 T5cV+Na6bK+C1xEijvu1epuNB4bN3J3EjG4NZYUzdag3ncbxl4WpeVE9gNS59mh1RPX7
 UH1JwchLta+XYoSGwaqwhcS47DIm/j20RGv9HeihvHnNKI+bwcQH1lOm3yV/YGvrGaA8
 579g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3f8hgu4AYbbzL3pt/Dovnq0LWFO0C3h9ft78bZ2gw5Qo68dLaSoT+4kHIFqOXT+5L3LXCUgEqsw==@nongnu.org
X-Gm-Message-State: AOJu0Yyi6wlcg6EU/OOe7i5YEaBRMXW2c/2IVLg6d+FWrY0oFmYBS+xc
 MPgCHlM5d9lIG0Yew57TDtz/Bs31pdPTOxDSc8gcmdbJMAhUAS/7Gk1JEfgrMNEjnfE=
X-Gm-Gg: ASbGncuSo9B1POwlDsQ25qaxlNitaY9m+AqO04Iyoqd+bzwf9rKgp4i5/MPEoTv4oao
 7d8zCCtevNtrV4snubHF8R61JbSxE4RmcH/bIUSWXDcUe3xUJXxMSLjXVxER0DyzvJJc5AXlCkQ
 5ufhXKMsd/G8GxXX5rIXKYqWA5D1dtf5fjAxRITM6YyMXvnue7LNyY1HmvHIGtX9pmVic2+i3xt
 YIDSmlGtHmhwpM0oTaCQohQwyOQ2U4QPh2AGIZriSLrOtLcb9tjhsWLE38bG4IVgXuZ2nLxITBo
 lwnPJXAPzZoQlV6ZmlFVE5C4CZp2vNUFn1JbBq6pD6vKdAmSfkDspFx5wXBhwDx/0A0BmQUbYdN
 BqFPp5LzvN6ZJNyzdpnB2lKkqOgLdhQ+1Tjle+px44FeDnJndbUmsZ6ZN4aLLIBWcESLRwDH+eV
 7lrZqy5WESjr7kPlcJecSjjKxiXMqv3asmnkvdc4ntBPM=
X-Google-Smtp-Source: AGHT+IGo/WV3P/gIXVAfOj6/zzovwdZjTmIZqHJo4uhakNqdIn1TXbytnnffIAvPc5ctlVK5bpNhcg==
X-Received: by 2002:a5d:5888:0:b0:427:151:3d9a with SMTP id
 ffacd0b85a97d-42704d52316mr12176398f8f.17.1761057525735; 
 Tue, 21 Oct 2025 07:38:45 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00ce3e2sm20644550f8f.47.2025.10.21.07.38.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 07:38:45 -0700 (PDT)
Message-ID: <aeeed164-d464-43b3-9ef3-487268099a98@linaro.org>
Date: Tue, 21 Oct 2025 16:38:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] Register API leaks fixes
Content-Language: en-US
To: Luc Michel <luc.michel@amd.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Alistair Francis <alistair@alistair23.me>
References: <20251017161809.235740-1-luc.michel@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251017161809.235740-1-luc.michel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 17/10/25 18:17, Luc Michel wrote:
> v3:
>    - Rebased on master
>    - Fixed compilation issues in intermediate patches [Phil]
>    - Parent the memory region in the REGISTER_ARRAY object to the
>      REGISTER_ARRAY object itself instead of the REGISTER_ARRAY owner.
>      This ensure correct finalizing order and fixes the use-after-free
>      encountered by Phil [Phil]


> Luc Michel (6):
>    hw/core/register: remove the REGISTER device type
>    hw/core/register: add the REGISTER_ARRAY type
>    hw/core/register: remove the calls to `register_finalize_block'
>    hw/core/register: remove the `register_finalize_block' function
>    hw/net/can/xlnx-versal-canfd: refactor the banked registers logic
>    hw/net/can/xlnx-versal-canfd: remove register API usage for banked
>      regs

Thanks, queued squashing on patch #5 ...:

-- >8 --
--- a/hw/net/can/xlnx-versal-canfd.c
+++ b/hw/net/can/xlnx-versal-canfd.c
@@ -1411,18 +1411,17 @@ static uint64_t canfd_srr_pre_write(RegisterInfo 
*reg, uint64_t val64)
  }

  static void filter_reg_write(XlnxVersalCANFDState *s, hwaddr addr,
-                             size_t bank_idx, uint32_t val)
+                             unsigned bank_idx, uint32_t val)
  {
      size_t reg_idx = addr / sizeof(uint32_t);

      if (!(s->regs[R_ACCEPTANCE_FILTER_CONTROL_REGISTER] &
          (1 << bank_idx))) {
          s->regs[reg_idx] = val;
      } else {
          g_autofree char *path = object_get_canonical_path(OBJECT(s));

          qemu_log_mask(LOG_GUEST_ERROR, "%s: Acceptance filter register 
0x%"
-                      HWADDR_PRIx " changed while filter %zu enabled\n",
+                      HWADDR_PRIx " changed while filter %u enabled\n",
                        path, addr, bank_idx + 1);
      }
  }
@@ -1782,16 +1781,19 @@ static void xlnx_versal_canfd_ptimer_cb(void 
*opaque)

  static bool canfd_decode_reg_bank(XlnxVersalCANFDState *s, hwaddr addr,
                                    hwaddr first_reg, hwaddr last_reg,
-                                  size_t num_banks, size_t *idx, size_t 
*offset)
+                                  size_t num_banks, unsigned *idx,
+                                  hwaddr *offset)
  {
      hwaddr base = addr - first_reg;
      hwaddr span = last_reg - first_reg + sizeof(uint32_t);
+    unsigned index = base / span;

-    *idx = base / span;
-
-    if (*idx >= num_banks) {
+    if (index >= num_banks) {
          return false;
      }
+    if (idx) {
+        *idx = index;
+    }

      *offset = base % span;
      *offset += first_reg;
@@ -1807,7 +1809,7 @@ static bool 
canfd_decode_reg_bank(XlnxVersalCANFDState *s, hwaddr addr,
   * @return true is the decoding succeded, false otherwise
   */
  static bool canfd_decode_addr(XlnxVersalCANFDState *s, hwaddr addr,
-                              size_t *idx, hwaddr *offset)
+                              unsigned *idx, hwaddr *offset)
  {
      if (addr <= A_RX_FIFO_WATERMARK_REGISTER) {
          /* from 0x0 to 0xec. Handled by the register API */
@@ -1852,11 +1854,10 @@ static bool 
canfd_decode_addr(XlnxVersalCANFDState *s, hwaddr addr,
  static uint64_t canfd_read(void *opaque, hwaddr addr, unsigned size)
  {
      XlnxVersalCANFDState *s = XILINX_CANFD(opaque);
-    size_t bank_idx;
      hwaddr reg_offset;
      uint64_t ret;

-    if (!canfd_decode_addr(s, addr, &bank_idx, &reg_offset)) {
+    if (!canfd_decode_addr(s, addr, NULL, &reg_offset)) {
          qemu_log_mask(LOG_GUEST_ERROR, TYPE_XILINX_CANFD
                        ": read to unknown register at address 0x%"
                        HWADDR_PRIx "\n", addr);
@@ -1875,7 +1876,7 @@ static void canfd_write(void *opaque, hwaddr addr, 
uint64_t value,
                          unsigned size)
  {
      XlnxVersalCANFDState *s = XILINX_CANFD(opaque);
-    size_t bank_idx;
+    unsigned bank_idx;
      hwaddr reg_offset;

      if (!canfd_decode_addr(s, addr, &bank_idx, &reg_offset)) {
---

... in order to avoid:

hw/net/can/xlnx-versal-canfd.c:1822:59: error: incompatible pointer 
types passing 'hwaddr *' (aka 'unsigned long long *') to parameter of 
type 'size_t *' (aka 'unsigned long *') 
[-Werror,-Wincompatible-pointer-types]
  1822 |                                      s->cfg.tx_fifo, idx, offset);
       |                                                           ^~~~~~
hw/net/can/xlnx-versal-canfd.c:1785:74: note: passing argument to 
parameter 'offset' here
  1785 |                                   size_t num_banks, size_t 
*idx, size_t *offset)
       | 
          ^
hw/net/can/xlnx-versal-canfd.c:1827:47: error: incompatible pointer 
types passing 'hwaddr *' (aka 'unsigned long long *') to parameter of 
type 'size_t *' (aka 'unsigned long *') 
[-Werror,-Wincompatible-pointer-types]
  1827 |                                      32, idx, offset);
       |                                               ^~~~~~
hw/net/can/xlnx-versal-canfd.c:1785:74: note: passing argument to 
parameter 'offset' here
  1785 |                                   size_t num_banks, size_t 
*idx, size_t *offset)
       | 
          ^
hw/net/can/xlnx-versal-canfd.c:1833:47: error: incompatible pointer 
types passing 'hwaddr *' (aka 'unsigned long long *') to parameter of 
type 'size_t *' (aka 'unsigned long *') 
[-Werror,-Wincompatible-pointer-types]
  1833 |                                      32, idx, offset);
       |                                               ^~~~~~
hw/net/can/xlnx-versal-canfd.c:1785:74: note: passing argument to 
parameter 'offset' here
  1785 |                                   size_t num_banks, size_t 
*idx, size_t *offset)
       | 
          ^
hw/net/can/xlnx-versal-canfd.c:1839:60: error: incompatible pointer 
types passing 'hwaddr *' (aka 'unsigned long long *') to parameter of 
type 'size_t *' (aka 'unsigned long *') 
[-Werror,-Wincompatible-pointer-types]
  1839 |                                      s->cfg.rx0_fifo, idx, offset);
       |                                                            ^~~~~~
hw/net/can/xlnx-versal-canfd.c:1785:74: note: passing argument to 
parameter 'offset' here
  1785 |                                   size_t num_banks, size_t 
*idx, size_t *offset)
       | 
          ^
hw/net/can/xlnx-versal-canfd.c:1845:60: error: incompatible pointer 
types passing 'hwaddr *' (aka 'unsigned long long *') to parameter of 
type 'size_t *' (aka 'unsigned long *') 
[-Werror,-Wincompatible-pointer-types]
  1845 |                                      s->cfg.rx1_fifo, idx, offset);
       |                                                            ^~~~~~
hw/net/can/xlnx-versal-canfd.c:1785:74: note: passing argument to 
parameter 'offset' here
  1785 |                                   size_t num_banks, size_t 
*idx, size_t *offset)
       | 
          ^
5 errors generated.


