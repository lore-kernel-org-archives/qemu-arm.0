Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp3905732lfi;
        Tue, 31 Mar 2020 05:30:42 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vt5BmSg/9mWpBGOSQqRe8JMYu6XN6tDHoft0gcKJdV9z2RKGBnKYwhzdM2lGH2k531t1Ncz
X-Received: by 2002:ae9:e894:: with SMTP id a142mr4733049qkg.379.1585657842029;
        Tue, 31 Mar 2020 05:30:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585657842; cv=none;
        d=google.com; s=arc-20160816;
        b=E7fe+yk8PlOsTH2Wre3edpLnGF4pl9lDJvwWpqRp3F/77Dsv7H4xMf0Zb1P6RGuyLA
         kn3902PNLfukVig2aYZ8fds1X+CXwCSg3AXMgiv6WKrwc3XOBQU92Iy/8fe89jUHA1Km
         NBnRy3S1dqTAtdLo2zkQM17+TOVjE4KafnBBwh6mK0TiORB2r2xs1A6g6LOMx/qeTJJW
         G6QlFmnbtzRyv1dmurhAEJM7rSl1d7UybhV9qnj4mGxIpxustQUj76b/F+d6P33II2ac
         IzKvWTocKdzafZQOOVrcee9WdoXk9FoJO4sGox2CLS6aLPry/p0Dm1zwHUPciKieDk9U
         CZWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=dcQY96yC2Hmnhsz+F0n5gaG7y34dqKC9gw0VPYbbaes=;
        b=NtGjH+DNJlmVtymappFsZKsLc35GHPSDVZC5zG0L5xBJcAgbdfd6FT2CLlRujZhXsB
         aN/1i6F3/lxTnzJTIW0g9xeyNyERIHe5CTLkBhsZsULx9pNYK1YxIVGHlCZwdkTXT/Y5
         cBwheMpCbGUQhIX2oiZ7Lzw4FQYWKBBS7gpj1Pn6KqnB3BEfY/A5VFYxvOcfqQYTRFRg
         yzdhPoBLAuARN/2E1tVMp6QEvgRVnxAZTsD/+ktF4+eBerUbnsNtFJSt9vMxl95NVRvn
         gXiHVZ2NYbu9rRVFopRRGQTKpsFGOcohzgiWzPTFdZATBBVdnQ2b5ERCNFjOVb7D+wjj
         aFGg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11si9218352qve.30.2020.03.31.05.30.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Mar 2020 05:30:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jJG2T-0008N1-Ef
	for alex.bennee@linaro.org; Tue, 31 Mar 2020 08:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35768)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhukeqian1@huawei.com>) id 1jJG2H-0008Mr-4k
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 08:30:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhukeqian1@huawei.com>) id 1jJG2F-0006e6-3c
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 08:30:28 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3220 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhukeqian1@huawei.com>)
 id 1jJG2E-0006ZC-Dv; Tue, 31 Mar 2020 08:30:27 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A1A2F735E375ED3CD107;
 Tue, 31 Mar 2020 20:30:17 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.230) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0;
 Tue, 31 Mar 2020 20:30:08 +0800
Subject: Re: [PATCH v2] migration/throttle: Add cpu-throttle-tailslow
 migration parameter
To: <qemu-devel@nongnu.org>
References: <20200316042935.28306-1-zhukeqian1@huawei.com>
From: zhukeqian <zhukeqian1@huawei.com>
Message-ID: <2113f5ba-be62-1963-a89a-d3f19cc80ed9@huawei.com>
Date: Tue, 31 Mar 2020 20:30:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20200316042935.28306-1-zhukeqian1@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.221.230]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 wanghaibin.wang@huawei.com, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: swaUNHNg1htQ

Friendly ping...

Hi all,

Could you please review this patch. Thanks very much.

Thanks,
Keqian

On 2020/3/16 12:29, Keqian Zhu wrote:
> At the tail stage of throttling, the Guest is very sensitive to
> CPU percentage while the @cpu-throttle-increment is excessive
> usually at tail stage.
> 
> If this parameter is true, we will compute the ideal CPU percentage
> used by the Guest, which may exactly makes dirty rate to be dirty
> rate threshold. Then we will choose a smaller throttle increment
> between the one specified by @cpu-throttle-increment and the one
> generated by ideal CPU percentage.
> 
> Therefore, it is compatible to traditional throttling, meanwhile
> the throttle increment won't be excessive at tail stage. This may
> make migration time longer, and is disabled by default.
> 
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> ---
>  migration/migration.c | 13 ++++++++++++
>  migration/ram.c       | 25 +++++++++++++++++-----
>  monitor/hmp-cmds.c    |  8 ++++++++
>  qapi/migration.json   | 48 +++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 89 insertions(+), 5 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index c1d88ace7f..cc157cbf90 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -785,6 +785,8 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
>      params->cpu_throttle_initial = s->parameters.cpu_throttle_initial;
>      params->has_cpu_throttle_increment = true;
>      params->cpu_throttle_increment = s->parameters.cpu_throttle_increment;
> +    params->has_cpu_throttle_tailslow = true;
> +    params->cpu_throttle_tailslow = s->parameters.cpu_throttle_tailslow;
>      params->has_tls_creds = true;
>      params->tls_creds = g_strdup(s->parameters.tls_creds);
>      params->has_tls_hostname = true;
> @@ -1323,6 +1325,10 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
>          dest->cpu_throttle_increment = params->cpu_throttle_increment;
>      }
>  
> +    if (params->has_cpu_throttle_tailslow) {
> +        dest->cpu_throttle_tailslow = params->cpu_throttle_tailslow;
> +    }
> +
>      if (params->has_tls_creds) {
>          assert(params->tls_creds->type == QTYPE_QSTRING);
>          dest->tls_creds = g_strdup(params->tls_creds->u.s);
> @@ -1411,6 +1417,10 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
>          s->parameters.cpu_throttle_increment = params->cpu_throttle_increment;
>      }
>  
> +    if (params->has_cpu_throttle_tailslow) {
> +        s->parameters.cpu_throttle_tailslow = params->cpu_throttle_tailslow;
> +    }
> +
>      if (params->has_tls_creds) {
>          g_free(s->parameters.tls_creds);
>          assert(params->tls_creds->type == QTYPE_QSTRING);
> @@ -3588,6 +3598,8 @@ static Property migration_properties[] = {
>      DEFINE_PROP_UINT8("x-cpu-throttle-increment", MigrationState,
>                        parameters.cpu_throttle_increment,
>                        DEFAULT_MIGRATE_CPU_THROTTLE_INCREMENT),
> +    DEFINE_PROP_BOOL("x-cpu-throttle-tailslow", MigrationState,
> +                      parameters.cpu_throttle_tailslow, false),
>      DEFINE_PROP_SIZE("x-max-bandwidth", MigrationState,
>                        parameters.max_bandwidth, MAX_THROTTLE),
>      DEFINE_PROP_UINT64("x-downtime-limit", MigrationState,
> @@ -3694,6 +3706,7 @@ static void migration_instance_init(Object *obj)
>      params->has_throttle_trigger_threshold = true;
>      params->has_cpu_throttle_initial = true;
>      params->has_cpu_throttle_increment = true;
> +    params->has_cpu_throttle_tailslow = true;
>      params->has_max_bandwidth = true;
>      params->has_downtime_limit = true;
>      params->has_x_checkpoint_delay = true;
> diff --git a/migration/ram.c b/migration/ram.c
> index c12cfdbe26..4b74461306 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -616,20 +616,34 @@ static size_t save_page_header(RAMState *rs, QEMUFile *f,  RAMBlock *block,
>   * able to complete migration. Some workloads dirty memory way too
>   * fast and will not effectively converge, even with auto-converge.
>   */
> -static void mig_throttle_guest_down(void)
> +static void mig_throttle_guest_down(uint64_t bytes_dirty_period,
> +                                    uint64_t bytes_dirty_threshold)
>  {
>      MigrationState *s = migrate_get_current();
>      uint64_t pct_initial = s->parameters.cpu_throttle_initial;
> -    uint64_t pct_icrement = s->parameters.cpu_throttle_increment;
> +    uint64_t pct_increment = s->parameters.cpu_throttle_increment;
> +    bool pct_tailslow = s->parameters.cpu_throttle_tailslow;
>      int pct_max = s->parameters.max_cpu_throttle;
>  
> +    uint64_t throttle_now = cpu_throttle_get_percentage();
> +    uint64_t cpu_now, cpu_ideal, throttle_inc;
> +
>      /* We have not started throttling yet. Let's start it. */
>      if (!cpu_throttle_active()) {
>          cpu_throttle_set(pct_initial);
>      } else {
>          /* Throttling already on, just increase the rate */
> -        cpu_throttle_set(MIN(cpu_throttle_get_percentage() + pct_icrement,
> -                         pct_max));
> +        if (!pct_tailslow) {
> +            throttle_inc = pct_increment;
> +        } else {
> +            /* Compute the ideal CPU percentage used by Guest, which
> +             * may makes dirty rate to be dirty rate threshold. */
> +            cpu_now = 100 - throttle_now;
> +            cpu_ideal = cpu_now * (bytes_dirty_threshold * 1.0 /
> +                        bytes_dirty_period);
> +            throttle_inc = MIN(cpu_now - cpu_ideal, pct_increment);
> +        }
> +        cpu_throttle_set(MIN(throttle_now + throttle_inc, pct_max));
>      }
>  }
>  
> @@ -919,7 +933,8 @@ static void migration_trigger_throttle(RAMState *rs)
>              (++rs->dirty_rate_high_cnt >= 2)) {
>              trace_migration_throttle();
>              rs->dirty_rate_high_cnt = 0;
> -            mig_throttle_guest_down();
> +            mig_throttle_guest_down(bytes_dirty_period,
> +                                    bytes_dirty_threshold);
>          }
>      }
>  }
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 58724031ea..29878632c8 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -419,6 +419,10 @@ void hmp_info_migrate_parameters(Monitor *mon, const QDict *qdict)
>          monitor_printf(mon, "%s: %u\n",
>              MigrationParameter_str(MIGRATION_PARAMETER_CPU_THROTTLE_INCREMENT),
>              params->cpu_throttle_increment);
> +        assert(params->has_cpu_throttle_tailslow);
> +        monitor_printf(mon, "%s: %s\n",
> +            MigrationParameter_str(MIGRATION_PARAMETER_CPU_THROTTLE_TAILSLOW),
> +            params->cpu_throttle_tailslow ? "on" : "off");
>          assert(params->has_max_cpu_throttle);
>          monitor_printf(mon, "%s: %u\n",
>              MigrationParameter_str(MIGRATION_PARAMETER_MAX_CPU_THROTTLE),
> @@ -1269,6 +1273,10 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
>          p->has_cpu_throttle_increment = true;
>          visit_type_int(v, param, &p->cpu_throttle_increment, &err);
>          break;
> +    case MIGRATION_PARAMETER_CPU_THROTTLE_TAILSLOW:
> +        p->has_cpu_throttle_tailslow = true;
> +        visit_type_bool(v, param, &p->cpu_throttle_tailslow, &err);
> +        break;
>      case MIGRATION_PARAMETER_MAX_CPU_THROTTLE:
>          p->has_max_cpu_throttle = true;
>          visit_type_int(v, param, &p->max_cpu_throttle, &err);
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 0d1c0712ca..4bf82b74d1 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -552,6 +552,21 @@
>  #                          auto-converge detects that migration is not making
>  #                          progress. The default value is 10. (Since 2.7)
>  #
> +# @cpu-throttle-tailslow: Make CPU throttling slower at tail stage
> +#                         At the tail stage of throttling, the Guest is very
> +#                         sensitive to CPU percentage while the @cpu-throttle
> +#                         -increment is excessive usually at tail stage.
> +#                         If this parameter is true, we will compute the ideal
> +#                         CPU percentage used by the Guest, which may exactly
> +#                         makes dirty rate to be dirty rate threshold. Then we
> +#                         will choose a smaller throttle increment between the
> +#                         one specified by @cpu-throttle-increment and the one
> +#                         generated by ideal CPU percentage.
> +#                         Therefore, it is compatible to traditional throttling,
> +#                         meanwhile the throttle increment won't be excessive
> +#                         at tail stage.
> +#                         The default value is false. (Since 5.0)
> +#
>  # @tls-creds: ID of the 'tls-creds' object that provides credentials for
>  #             establishing a TLS connection over the migration data channel.
>  #             On the outgoing side of the migration, the credentials must
> @@ -631,6 +646,7 @@
>             'compress-level', 'compress-threads', 'decompress-threads',
>             'compress-wait-thread', 'throttle-trigger-threshold',
>             'cpu-throttle-initial', 'cpu-throttle-increment',
> +           'cpu-throttle-tailslow',
>             'tls-creds', 'tls-hostname', 'tls-authz', 'max-bandwidth',
>             'downtime-limit', 'x-checkpoint-delay', 'block-incremental',
>             'multifd-channels',
> @@ -676,6 +692,21 @@
>  #                          auto-converge detects that migration is not making
>  #                          progress. The default value is 10. (Since 2.7)
>  #
> +# @cpu-throttle-tailslow: Make CPU throttling slower at tail stage
> +#                         At the tail stage of throttling, the Guest is very
> +#                         sensitive to CPU percentage while the @cpu-throttle
> +#                         -increment is excessive usually at tail stage.
> +#                         If this parameter is true, we will compute the ideal
> +#                         CPU percentage used by the Guest, which may exactly
> +#                         makes dirty rate to be dirty rate threshold. Then we
> +#                         will choose a smaller throttle increment between the
> +#                         one specified by @cpu-throttle-increment and the one
> +#                         generated by ideal CPU percentage.
> +#                         Therefore, it is compatible to traditional throttling,
> +#                         meanwhile the throttle increment won't be excessive
> +#                         at tail stage.
> +#                         The default value is false. (Since 5.0)
> +#
>  # @tls-creds: ID of the 'tls-creds' object that provides credentials
>  #             for establishing a TLS connection over the migration data
>  #             channel. On the outgoing side of the migration, the credentials
> @@ -763,6 +794,7 @@
>              '*throttle-trigger-threshold': 'int',
>              '*cpu-throttle-initial': 'int',
>              '*cpu-throttle-increment': 'int',
> +            '*cpu-throttle-tailslow': 'bool',
>              '*tls-creds': 'StrOrNull',
>              '*tls-hostname': 'StrOrNull',
>              '*tls-authz': 'StrOrNull',
> @@ -834,6 +866,21 @@
>  #                          auto-converge detects that migration is not making
>  #                          progress. (Since 2.7)
>  #
> +# @cpu-throttle-tailslow: Make CPU throttling slower at tail stage
> +#                         At the tail stage of throttling, the Guest is very
> +#                         sensitive to CPU percentage while the @cpu-throttle
> +#                         -increment is excessive usually at tail stage.
> +#                         If this parameter is true, we will compute the ideal
> +#                         CPU percentage used by the Guest, which may exactly
> +#                         makes dirty rate to be dirty rate threshold. Then we
> +#                         will choose a smaller throttle increment between the
> +#                         one specified by @cpu-throttle-increment and the one
> +#                         generated by ideal CPU percentage.
> +#                         Therefore, it is compatible to traditional throttling,
> +#                         meanwhile the throttle increment won't be excessive
> +#                         at tail stage.
> +#                         The default value is false. (Since 5.0)
> +#
>  # @tls-creds: ID of the 'tls-creds' object that provides credentials
>  #             for establishing a TLS connection over the migration data
>  #             channel. On the outgoing side of the migration, the credentials
> @@ -921,6 +968,7 @@
>              '*throttle-trigger-threshold': 'uint8',
>              '*cpu-throttle-initial': 'uint8',
>              '*cpu-throttle-increment': 'uint8',
> +            '*cpu-throttle-tailslow': 'bool',
>              '*tls-creds': 'str',
>              '*tls-hostname': 'str',
>              '*tls-authz': 'str',
> 

