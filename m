Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDADEC0495
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 10:14:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxMlc-00039X-Hw; Tue, 03 Mar 2026 05:14:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vxMlb-000395-1s
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 05:14:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vxMlX-0005zv-Rz
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 05:14:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772532851;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XqKELOYFCMhde0Q+Ydx8qQXe1hB+QRSJuyHARgE21Mk=;
 b=Am4lquNltJR1yBRxtZ5KOSF3Z0AlnWjvngpiIbztwPEuaKTbKRsjK8S4N2M007kBGIwA+Q
 43y7BoKrIilaq+1mOlr75xgzYBzY5Yn6fF8NYL3tDZgKADovG+/hsN1Yr1yFCqAl16w2W+
 xEnum8Y7WkPSkgASX74PYoxtGEE180w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-EWDh2JpyNkWEuUu1g5sgxA-1; Tue, 03 Mar 2026 05:14:07 -0500
X-MC-Unique: EWDh2JpyNkWEuUu1g5sgxA-1
X-Mimecast-MFC-AGG-ID: EWDh2JpyNkWEuUu1g5sgxA_1772532847
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4837b7903f3so65441145e9.2
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 02:14:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772532847; x=1773137647;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XqKELOYFCMhde0Q+Ydx8qQXe1hB+QRSJuyHARgE21Mk=;
 b=vByQVUPzcdzYsFiR4MqkfZoDEHt4PhuL2EoR1154+5GMnad4EcTL10E4+VIc1Sxy31
 tKyNNombUpvP1PZbRCc6Eh3/xHFeAZk7Blp8/BiBONReYPt2EhvzC5ZvCHZV4dqpoQSv
 lIP7KDUPjT0giFy3Elmjuf7/fudppGhADjstsH05yYE9QOE8yCuU6t6CYhCYuFwMr4Uw
 IXj0BvZI0y/tLN4rB1BZo5sgGAWglO/g/TgxiHXRpZ/IN+YFXjno2gZhRrpx99N2PBK0
 bc4tj5p+VOe57JQeRgCxiTGjKCFexRH1YJkDuj0uwIfsJbnTC0MD/QqAvGm2LnPwCWOe
 F+Mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRPVoufzEV3HC7e/20/enHi/5oKYarVPF7lsoTQM/UuTlvPB5kHeAO6X0KijIfK3qxhYxeG9K/gA==@nongnu.org
X-Gm-Message-State: AOJu0YzSFWB5FsMjiORGdf7TOF755oY+2ZYhHD4ZzQ2psdcEQQIhcMY8
 uZCMFJMHwfVcXminIrcyaXOUFlsKRQHktdO2OzPrdE2wVcmyUxBdoa60dWPdYIqr4cNNXygqjSB
 mbB7ikYXTJ/bOyrHoj4avZnUaDIesijzGpwOFdDYDkmeyS0mlRd+Z/w==
X-Gm-Gg: ATEYQzzfgISvEOIrvA9Sd8/dQaAN4/ZLENsJJReOMqjOW/nPVlUejjg33+0sHehuOQO
 Sa6PHVxxjttG+9gf5SAfpXpz9gtPTjt52AFyBA1YeGWun7+T1sITDe6Lh/q1NBJvjeNsblOSSrG
 vfVUi2UiZqwQqNfCpeRovYsV6eQr7JcTz+3Q5ML8AtM1Gsr7hLDYZ8R3h0QGb+Qw/2fe/ITTAxy
 jQADpJwclDazptvaa79sOVa6Sa+28xwGAIHxXMxK3DezSp8tNBh30lLHr0k+ZNDIErXFmbVh8Lx
 ZWe+RnJzl5JKnSDosD5XNvF5jtINlCin6DbQA+svISy+ui3qN7LDj2N8qVPgG6ZroCqcn4rFHCh
 pyDvWKt9Cx89Ikmpc6pRk6wYIUVjQS0akXR2ubl5DBpbAeNF7aSnGRjHeOkVaaTjQOO5+5g==
X-Received: by 2002:a05:600c:1393:b0:483:498f:7963 with SMTP id
 5b1f17b1804b1-483c9c1f8fcmr262020185e9.26.1772532846493; 
 Tue, 03 Mar 2026 02:14:06 -0800 (PST)
X-Received: by 2002:a05:600c:1393:b0:483:498f:7963 with SMTP id
 5b1f17b1804b1-483c9c1f8fcmr262019765e9.26.1772532845933; 
 Tue, 03 Mar 2026 02:14:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483c3b4a121sm332140885e9.8.2026.03.03.02.14.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 02:14:05 -0800 (PST)
Message-ID: <d2eb3ef9-01f3-48cb-80c5-9e49174ab992@redhat.com>
Date: Tue, 3 Mar 2026 11:14:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 17/31] hw/arm/smmuv3: Pass sec_sid into cmdq consume path
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu.zevorn@gmail.com>
References: <20260221100250.2976287-1-tangtao1634@phytium.com.cn>
 <20260221101714.2994490-1-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260221101714.2994490-1-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MvwvzPDtTk-rZRGSOBu_At-sKkrNthrOXUUPSpRx5ug_1772532847
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.968, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.495,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 2/21/26 11:17 AM, Tao Tang wrote:
> Make smmuv3_cmdq_consume() security-state aware by passing sec_sid
> from smmu_writel() call sites (CR0/GERRORN/CMDQ_PROD paths), instead
> of hardcoding non-secure state. The related AddressSpace and MemTxAttrs
> are also obtained based on sec_sid.
>
> Also move CMD_SSEC legality checking to a single early check before
> command dispatch: secure commands are rejected on non-secure queues
> (including future Realm queue) with CERROR_ILL. This removes duplicated
> per-command checks in CFGI handlers.
>
> Finally, extend cmdq trace output with sec_sid so command processing
> can be correlated with the correct security bank.
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>  hw/arm/smmuv3.c     | 50 ++++++++++++++++++++++-----------------------
>  hw/arm/trace-events |  2 +-
>  2 files changed, 26 insertions(+), 26 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index e33a7babd1c..b2559e80f24 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -111,14 +111,14 @@ static void smmuv3_write_gerrorn(SMMUv3State *s, uint32_t new_gerrorn)
>      trace_smmuv3_write_gerrorn(toggled & pending, bank->gerrorn);
>  }
>  
> -static inline MemTxResult queue_read(SMMUQueue *q, Cmd *cmd)
> +static inline MemTxResult queue_read(SMMUQueue *q, Cmd *cmd,
> +                                     AddressSpace *as, MemTxAttrs attrs)
>  {
>      dma_addr_t addr = Q_CONS_ENTRY(q);
>      MemTxResult ret;
>      int i;
>  
> -    ret = dma_memory_read(&address_space_memory, addr, cmd, sizeof(Cmd),
> -                          MEMTXATTRS_UNSPECIFIED);
> +    ret = dma_memory_read(as, addr, cmd, sizeof(Cmd), attrs);
>      if (ret != MEMTX_OK) {
>          return ret;
>      }
> @@ -1346,14 +1346,17 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage,
>      }
>  }
>  
> -static int smmuv3_cmdq_consume(SMMUv3State *s, Error **errp)
> +static int smmuv3_cmdq_consume(SMMUv3State *s, Error **errp, SMMUSecSID sec_sid)
>  {
>      SMMUState *bs = ARM_SMMU(s);
>      SMMUCmdError cmd_error = SMMU_CERROR_NONE;
> -    SMMUSecSID sec_sid = SMMU_SEC_SID_NS;
>      SMMUv3RegBank *bank = smmuv3_bank(s, sec_sid);
>      SMMUQueue *q = &bank->cmdq;
>      SMMUCommandType type = 0;
> +    MemTxAttrs attrs = smmu_get_txattrs(sec_sid);
> +    AddressSpace *as = smmu_get_address_space(bs, sec_sid);
> +    /* Secure AddressSpace must be available, assert if not. */
> +    g_assert(as);
pls remove that check
>  
>      if (!smmuv3_cmdq_enabled(s, sec_sid)) {
>          return 0;
> @@ -1369,18 +1372,30 @@ static int smmuv3_cmdq_consume(SMMUv3State *s, Error **errp)
>          uint32_t pending = bank->gerror ^ bank->gerrorn;
>          Cmd cmd;
>  
> -        trace_smmuv3_cmdq_consume(Q_PROD(q), Q_CONS(q),
> +        trace_smmuv3_cmdq_consume(sec_sid, Q_PROD(q), Q_CONS(q),
>                                    Q_PROD_WRAP(q), Q_CONS_WRAP(q));
>  
>          if (FIELD_EX32(pending, GERROR, CMDQ_ERR)) {
>              break;
>          }
>  
> -        if (queue_read(q, &cmd) != MEMTX_OK) {
> +        if (queue_read(q, &cmd, as, attrs) != MEMTX_OK) {
>              cmd_error = SMMU_CERROR_ABT;
>              break;
>          }
>  
> +        /*
> +         * Secure Command on Non-secure Command queue, including Realm Command
> +         * queue, is not allowed. CERROR_ILL will be raised according to
> +         * (IHI 0070G.b) 4.1.6 Common command fields, Page 168.
> +         */
> +        if (CMD_SSEC(&cmd)) {
> +            if (sec_sid != SMMU_SEC_SID_S) {
nit combine both checks
> +                cmd_error = SMMU_CERROR_ILL;
> +                break;
> +            }
> +        }
> +
>          type = CMD_TYPE(&cmd);
>  
>          trace_smmuv3_cmdq_opcode(smmu_cmd_string(type));
> @@ -1400,11 +1415,6 @@ static int smmuv3_cmdq_consume(SMMUv3State *s, Error **errp)
>              uint32_t sid = CMD_SID(&cmd);
>              SMMUDevice *sdev = smmu_find_sdev(bs, sid);
>  
> -            if (CMD_SSEC(&cmd)) {
> -                cmd_error = SMMU_CERROR_ILL;
> -                break;
> -            }
> -
>              if (!sdev) {
>                  break;
>              }
> @@ -1424,11 +1434,6 @@ static int smmuv3_cmdq_consume(SMMUv3State *s, Error **errp)
>              uint8_t range = CMD_STE_RANGE(&cmd);
>              SMMUSIDRange sid_range;
>  
> -            if (CMD_SSEC(&cmd)) {
> -                cmd_error = SMMU_CERROR_ILL;
> -                break;
> -            }
> -
>              mask = (1ULL << (range + 1)) - 1;
>              sid_range.start = sid & ~mask;
>              sid_range.end = sid_range.start + mask;
> @@ -1447,11 +1452,6 @@ static int smmuv3_cmdq_consume(SMMUv3State *s, Error **errp)
>              uint32_t sid = CMD_SID(&cmd);
>              SMMUDevice *sdev = smmu_find_sdev(bs, sid);
>  
> -            if (CMD_SSEC(&cmd)) {
> -                cmd_error = SMMU_CERROR_ILL;
> -                break;
> -            }
> -
>              if (!sdev) {
>                  break;
>              }
> @@ -1666,7 +1666,7 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
>          bank->cr[0] = data;
>          bank->cr0ack = data & ~SMMU_CR0_RESERVED;
>          /* in case the command queue has been enabled */
> -        smmuv3_cmdq_consume(s, &local_err);
> +        smmuv3_cmdq_consume(s, &local_err, reg_sec_sid);
>          break;
>      case A_CR1:
>          bank->cr[1] = data;
> @@ -1683,7 +1683,7 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
>           * By acknowledging the CMDQ_ERR, SW may notify cmds can
>           * be processed again
>           */
> -        smmuv3_cmdq_consume(s, &local_err);
> +        smmuv3_cmdq_consume(s, &local_err, reg_sec_sid);
>          break;
>      case A_GERROR_IRQ_CFG0: /* 64b */
>          bank->gerror_irq_cfg0 = deposit64(bank->gerror_irq_cfg0, 0, 32, data);
> @@ -1733,7 +1733,7 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
>          break;
>      case A_CMDQ_PROD:
>          bank->cmdq.prod = data;
> -        smmuv3_cmdq_consume(s, &local_err);
> +        smmuv3_cmdq_consume(s, &local_err, reg_sec_sid);
>          break;
>      case A_CMDQ_CONS:
>          bank->cmdq.cons = data;
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index 4e360b3c0d3..ca8485c96af 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -35,7 +35,7 @@ smmuv3_trigger_irq(int irq) "irq=%d"
>  smmuv3_write_gerror(uint32_t toggled, uint32_t gerror) "toggled=0x%x, new GERROR=0x%x"
>  smmuv3_write_gerrorn(uint32_t acked, uint32_t gerrorn) "acked=0x%x, new GERRORN=0x%x"
>  smmuv3_unhandled_cmd(uint32_t type) "Unhandled command type=%d"
> -smmuv3_cmdq_consume(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "prod=%d cons=%d prod.wrap=%d cons.wrap=%d"
> +smmuv3_cmdq_consume(int sec_sid, uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "sec_sid=%d prod=%d cons=%d prod.wrap=%d cons.wrap=%d"
>  smmuv3_cmdq_opcode(const char *opcode) "<--- %s"
>  smmuv3_cmdq_consume_out(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "prod:%d, cons:%d, prod_wrap:%d, cons_wrap:%d "
>  smmuv3_cmdq_consume_error(const char *cmd_name, uint8_t cmd_error) "Error on %s command execution: %d"
Besides looks good to me
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


