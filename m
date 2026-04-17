Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42FFFF8E4AB
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 06:32:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDckF-0003zS-5T; Fri, 17 Apr 2026 02:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDcju-0003qm-Vq
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 02:31:45 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDcjs-0007e3-EE
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 02:31:42 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso2428675e9.1
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2026 23:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776407498; x=1777012298; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a5d82qrKjL+6McFv5agOhbQV+/m3rW5pVxKwgqg4oGQ=;
 b=bkl92hkziEOo7kzF7pKpAxEV1UR/9IUwqO8hm0wSemcNgnop7uya7NLGN9caVy/8xH
 mOohzyoBwqrJ0CPzMlm+pyYzbyNPiBIe47mVxhlROPq0B02R+XeTNGlF/mnvIbEAtKAo
 WvLqqhDWOTMosrfYbEEYFARHcJF5akebeBOGValG9V3JiSJKA07o6yhGwhL3mnD8G0nA
 2gRPaTvlHIvic+uQOQug49Syt+fRM1SkM8HJXEx+ICVesvd9PXG/zeis2xfWyM2gaQ6w
 hwlnzEYqCAEMplkRFsUxj4tG/DN2sb+mpRmhOrGSXRmSBIMuP/XYTfqCBaMwPveFdFCX
 k7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776407498; x=1777012298;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a5d82qrKjL+6McFv5agOhbQV+/m3rW5pVxKwgqg4oGQ=;
 b=Qs5zSv95+ReoYNzM2OErDchgGCZ2bcE1jdxsoqHMqL+m7YfSFoJgAEbx85xA56z2/h
 bzBFLCEia/x/CoJAtfGV4IRybysDtjPXmnQkv7KpwIABdXvHRoeelx1H+InWiy5B5RZX
 OsJacjY75sqdeoGbN7B6VDChfEK9EYcXslmg9+prwdC07SSGsKcEY00TpIQsB16ogeJO
 weUcyvYiESxy3KA7MXkmfo3N2eNM6eRIWH7WcjEFqY88Oi2pcRJ1EV5ybE1qFIuKy9ZM
 G8iWTFUvGHVQrgWeEnK85U2VsVdBtJS9ElLNGYdIQPnnsD9igSb01NCzhGPTrX8MXcoZ
 k2Og==
X-Forwarded-Encrypted: i=1;
 AFNElJ8pl1PjgKyn2haetIK60Xlp6CqFVxefe5KLr3X/yWI3zqa2wsB6iNHq7LTGasXFNg1ps87dAdjiVg==@nongnu.org
X-Gm-Message-State: AOJu0Yw0n2zWWCFGrqRNQkXtd2XUDc/6AbLHZ/ucJcLm8cWK5U1s0qYw
 xeLAR7zxpF0Chei3KpDvyupg43dQ8YGyhjpQULBPW3ntq1GwowTdsk4fbGQ8cRuSxw4=
X-Gm-Gg: AeBDievBBNeMKmOn0liWKy+yZbyeACXIUlvhlZO9u0pWAe5OiG5nQJz7a7iiAzn22Dq
 +SM2hQgBbRlwiSIPGieLQQfoXl1AV9wbTtsAtLqa9MZ5q4jjyOW+cNJsTrzCYEa1hY4UReaTTwR
 v4DHt3pNv8siWzhcRsK1bFHrGZ1Zry3WPBIYCOeeAmOeMmZLdpKvWY/PMJwwM14uZNR1B4MNdNN
 YZABKufkMPxjYbNKi0mvdHQ+25f94NEL/7hZpvYs/fu38Vro7G2g8SLAzp2ZgaTiyWehEsJguw6
 fxo0ImL4qhPpdZ1I4fRMZgShsKwgjtS/usRYhQx5sUMxgcUzfzqvcG8vwf0erGs+hyZ2Ax/QU/Z
 GOFkPoR9ok1+qd/roTzup2Mdyd3g6go2SxP/hubzIg+CjzigwDZ849Qg42jegjwpjiEhwl+NDz+
 rndcqAFxnIKUUXU5hd1+tLZXTeEOvX90RiLL+jSxa+QNBYiRA85ED2XBlimhHqktFn+LtwhIiId
 eRQ
X-Received: by 2002:a05:600c:3150:b0:485:3b00:f93b with SMTP id
 5b1f17b1804b1-488fb79df09mr19927055e9.31.1776407498437; 
 Thu, 16 Apr 2026 23:31:38 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1393d3sm30152225e9.11.2026.04.16.23.31.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 23:31:37 -0700 (PDT)
Message-ID: <3f586dbd-9695-452e-9afb-e4cb49a40b77@linaro.org>
Date: Fri, 17 Apr 2026 08:31:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/17] hw/usb/hcd-ehci.c: Replace fprintf(stderr, ...)
 with qemu_log_mask(LOG_GUEST_ERROR)
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>, "flwu@google.com" <flwu@google.com>,
 "nabihestefan@google.com" <nabihestefan@google.com>
References: <20260416014928.1279360-1-jamin_lin@aspeedtech.com>
 <20260416014928.1279360-5-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260416014928.1279360-5-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 16/4/26 03:49, Jamin Lin wrote:
> Replace direct fprintf(stderr, ...) calls with qemu_log_mask()
> using LOG_GUEST_ERROR in the EHCI controller implementation.
> 
> Direct writes to stderr are discouraged in QEMU as they bypass
> the logging framework and cannot be filtered or controlled at
> runtime. Using qemu_log_mask() ensures that guest-visible errors
> are properly categorized and can be managed via QEMU logging
> options.
> 
> All affected messages correspond to guest-triggerable error
> conditions, so LOG_GUEST_ERROR is used consistently.
> 
> This change improves integration with QEMU's logging infrastructure
> and aligns with upstream coding guidelines.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/usb/hcd-ehci.c | 43 +++++++++++++++++++++++++------------------
>   1 file changed, 25 insertions(+), 18 deletions(-)


> @@ -532,7 +533,7 @@ static void ehci_free_packet(EHCIPacket *p)
>       }
>       if (p->async == EHCI_ASYNC_FINISHED &&
>               p->packet.status == USB_RET_SUCCESS) {
> -        fprintf(stderr,
> +        qemu_log_mask(LOG_GUEST_ERROR,
>                   "EHCI: Dropping completed packet from halted %s ep %02X\n",
>                   (p->pid == USB_TOKEN_IN) ? "in" : "out",
>                   get_field(p->queue->qh.epchar, QH_EPCHAR_EP));
> @@ -1042,8 +1043,9 @@ static void ehci_opreg_write(void *ptr, hwaddr addr,
>   
>           /* not supporting dynamic frame list size at the moment */
>           if ((val & USBCMD_FLS) && !(s->usbcmd & USBCMD_FLS)) {
> -            fprintf(stderr, "attempt to set frame list size -- value %d\n",
> -                    (int)val & USBCMD_FLS);
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "attempt to set frame list size -- value %d\n",

PRId64

> +                          (int)val & USBCMD_FLS);
>               val &= ~USBCMD_FLS;
>           }

> @@ -1584,7 +1589,8 @@ static int ehci_state_fetchentry(EHCIState *ehci, int async)
>   
>       /* section 4.8, only QH in async schedule */
>       if (async && (NLPTR_TYPE_GET(entry) != NLPTR_TYPE_QH)) {
> -        fprintf(stderr, "non queue head request in async schedule\n");
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "non queue head request in async schedule\n");
>           return -1;
>       }
>   
> @@ -1606,7 +1612,7 @@ static int ehci_state_fetchentry(EHCIState *ehci, int async)
>   
>       default:
>           /* TODO: handle FSTN type */
> -        fprintf(stderr, "FETCHENTRY: entry at %X is of type %u "
> +        qemu_log_mask(LOG_GUEST_ERROR, "FETCHENTRY: entry at %X is of type %u "

"0x%x"

>                   "which is not supported yet\n", entry, NLPTR_TYPE_GET(entry));
>           return -1;
>       }
> @@ -2112,13 +2118,14 @@ static void ehci_advance_state(EHCIState *ehci, int async)
>               break;
>   
>           default:
> -            fprintf(stderr, "Bad state!\n");
> +            qemu_log_mask(LOG_GUEST_ERROR, "Bad state!\n");

Just remove for "bad state" entries?

>               g_assert_not_reached();
>           }
>   
>           if (again < 0 || itd_count > 16) {
>               /* TODO: notify guest (raise HSE irq?) */
> -            fprintf(stderr, "processing error - resetting ehci HC\n");
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "processing error - resetting ehci HC\n");
>               ehci_reset(ehci);
>               again = 0;
>           }
> @@ -2175,7 +2182,7 @@ static void ehci_advance_async_state(EHCIState *ehci)
>   
>       default:
>           /* this should only be due to a developer mistake */
> -        fprintf(stderr, "ehci: Bad asynchronous state %d. "
> +        qemu_log_mask(LOG_GUEST_ERROR, "ehci: Bad asynchronous state %d. "
>                   "Resetting to active\n", ehci->astate);

Ditto.

>           g_assert_not_reached();
>       }
> @@ -2225,7 +2232,7 @@ static void ehci_advance_periodic_state(EHCIState *ehci)
>   
>       default:
>           /* this should only be due to a developer mistake */
> -        fprintf(stderr, "ehci: Bad periodic state %d. "
> +        qemu_log_mask(LOG_GUEST_ERROR, "ehci: Bad periodic state %d. "
>                   "Resetting to active\n", ehci->pstate);
>           g_assert_not_reached();

Ditto.

>       }


